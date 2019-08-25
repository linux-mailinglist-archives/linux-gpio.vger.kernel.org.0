Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C59BD9C2A2
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Aug 2019 11:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727139AbfHYJOt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 25 Aug 2019 05:14:49 -0400
Received: from antares.kleine-koenig.org ([94.130.110.236]:40686 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbfHYJOt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 25 Aug 2019 05:14:49 -0400
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id 8EE3078045E; Sun, 25 Aug 2019 11:14:45 +0200 (CEST)
Date:   Sun, 25 Aug 2019 11:14:42 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v1 1/2] vsprintf: introduce %dE for error constants
Message-ID: <20190825091442.GA5817@taurus.defre.kleine-koenig.org>
References: <20190824233724.1775-1-uwe@kleine-koenig.org>
 <20190824165829.7d330367992c62dab87f6652@linux-foundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline
In-Reply-To: <20190824165829.7d330367992c62dab87f6652@linux-foundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Andrew,

On Sat, Aug 24, 2019 at 04:58:29PM -0700, Andrew Morton wrote:
> (cc printk maintainers).

Ah, I wasn't aware there is something like them. Thanks

> On Sun, 25 Aug 2019 01:37:23 +0200 Uwe Kleine-K=F6nig <uwe@kleine-koenig.=
org> wrote:
>=20
> > 	pr_info("probing failed (%dE)\n", ret);
> >=20
> > expands to
> >=20
> > 	probing failed (EIO)
> >=20
> > if ret holds -EIO (or EIO). This introduces an array of error codes. If
> > the error code is missing, %dE falls back to %d and so prints the plain
> > number.
>=20
> Huh.  I'm surprised we don't already have this.  Seems that this will
> be applicable in a lot of places?  Although we shouldn't go blindly
> converting everything in sight - that would risk breaking userspace
> which parses kernel strings.

Uah, even the kernel log is API? But I agree so far that this is merge
window material and shouldn't make it into v5.3 :-)

> Is it really necessary to handle the positive errnos?  Does much kernel
> code actually do that (apart from kernel code which is buggy)?

I didn't check; probably not. But the whole positive range seems so
unused and interpreting EIO (and not only -EIO) as "EIO" seems straight
forward. But I don't feel strong either way.

> > Signed-off-by: Uwe Kleine-K=F6nig <uwe@kleine-koenig.org>
> > ---
> > Hello
> >=20
> > there are many code sites that benefit from this. Just grep for
> > "(%d)" ...
>=20
> Yup.  This observation shouldn't be below the "^---$" ;) An approximate
> grep|wc would be interesting.

I didn't check how many false positives there are using "(%d)", but I'd
use an a bit more elaborate expression for the commit log:

	$ git grep '(%d)' | wc -l
	7336
	$ git grep -E '^\s*(printk|(kv?as|sn?|vs(c?n)?)printf|(kvm|dev|pr)_(emerg|=
alert|crit|err|warn(ing)?|notice|info|cont|devel|debug|dbg))\(.*(\(%d\)|: %=
d)\\n' | wc -l
	9140

The latter matches several printk-variants emitting a string ending in
one of

	'(%d)\n' (1839 matches)
	': %d\n' (7301 matches)

=2E I would expect that many of the 7336 matches for '(%d)' that are not
matched by the longer expression are false negatives because the
function name is in the previous line. So I would estimate around 10k
strings that could benefit from %dE.

> > --- a/lib/vsprintf.c
> > +++ b/lib/vsprintf.c
> > @@ -533,6 +533,192 @@ char *number(char *buf, char *end, unsigned long =
long num,
> >  	return buf;
> >  }
> > =20
> > +#define ERRORCODE(x) { .str =3D #x, .err =3D x }
> > +
> > +static const struct {
> > +	const char *str;
> > +	int err;
> > +} errorcodes[] =3D {
>=20
> It's a bit of a hack, but an array of char*'s and a separate array of
> ushorts would save a bit of space.

Hmm, true. Currently we have 150 entries taking 150 * (sizeof(void *) *
2). Is it worth to think about the hacky solution to go down to 150 *
(sizeof(void *) + 2)?

For an ARM build bloat-o-meter reports (comparing linus/master to linus/mas=
ter
+ my patch):

	add/remove: 2/0 grow/shrink: 4/2 up/down: 1488/-8 (1480)
	Function                                     old     new   delta
	errorcodes                                     -    1200   +1200
	errstr                                         -     200    +200
	vsnprintf                                    884     960     +76
	set_precision                                148     152      +4
	resource_string                             1380    1384      +4
	flags_string                                 400     404      +4
	num_to_str                                   288     284      -4
	format_decode                               1024    1020      -4
	Total: Before=3D21686, After=3D23166, chg +6.82%

But that doesn't seem to include the size increase for all the added
strings which seems to be around another 1300 bytes.

> > +	ERRORCODE(EPERM),
> > +	ERRORCODE(ENOENT),
> > +	ERRORCODE(ESRCH),
> >
> > ...
> >
> > +static noinline_for_stack
>=20
> Why this?  I'm suspecting this will actually increase stack use?

I don't know what it does, just copied it from number() which is used
similarly.
=20
> > +char *errstr(char *buf, char *end, unsigned long long num,
> > +	     struct printf_spec spec)
> > +{
> > +	char *errname =3D NULL;

I missed a warning during my tests, there is a const missing in this
line.

> > +	size_t errnamelen, copy;
> > +	int i;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(errorcodes); ++i) {
> > +		if (num =3D=3D errorcodes[i].err || num =3D=3D -errorcodes[i].err) {
> > +			errname =3D errorcodes[i].str;
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (!errname) {
> > +		/* fall back to ordinary number */
> > +		return number(buf, end, num, spec);
> > +	}
> > +
> > +	copy =3D errnamelen =3D strlen(errname);
> > +	if (copy > end - buf)
> > +		copy =3D end - buf;
> > +	buf =3D memcpy(buf, errname, copy);
> > +
> > +	return buf + errnamelen;
> > +}
>=20
> OK, I guess `errstr' is an OK name for a static function

IMHO the name is very generic (which is bad), but it is in good company,
as there is also pointer() and number().

> and we can use this to add a new strerror() should the need arise.

In userspace the purpose of strerror is different. It would yield "I/O
error" not "EIO". So strerror using this array would only be a "strerror
light".

In my first prototype I even used %m instead of %dE, but as %m (in
glibc) doesn't consume an argument and produces the more verbose
variant, I changed my mind and went for %dE. (Also my patch has the
undocumented side effect that you can use %ldE if the error is held by a
long int. I didn't test that though.)=20

Best regards
Uwe

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl1iUX8ACgkQwfwUeK3K
7Ak8AggAg9w5Pql+nouxosqsiPNyoP+rCbUjQrqWm2u7RgpWlh8zss4beHP1s+nW
Jbdyc6h75UyZNYN0aT0jQdChIPnleMl/hMKz+EAnQ8vn+PztKYbluFeUabkbPkzY
V1gD0/qAzOG+do+IWtbKmSx/5oxLbGW4S9Dmspbyp7CLWEx7aNsrXQ+MQSAGSuPC
DOEfTZr0EADB+TnY+DM9pPYoTs5ntrnH0762gTow0X2ncqS/DBOvmuOU0Z9CrHXx
xtfWGKnPCXVIVaUzbbi+g2FvWTPhQ/wX1Ii4hGldjST/BufLCgl+tdadfxhozslp
SNUmbSPvecTEjqjawTIS1YYsD8QDEw==
=PTR/
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
