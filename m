Return-Path: <linux-gpio+bounces-17465-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A11EFA5D12C
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 21:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D489A173E22
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 20:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE218264A70;
	Tue, 11 Mar 2025 20:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="Lx4reNC1";
	dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b="P0IDCt1D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497BC1F78F3;
	Tue, 11 Mar 2025 20:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=72.84.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741726398; cv=fail; b=YANSrAHCxh28V2JWWKy6kJXduaPCCWEuJhtCWe/xCE4BY9a2FImwufA/c1TfW/bnUQFQRcvrCH+AlGhrXmejaH6bt48iWimJPR4lFuSr9BIz/DlJBrQtsW2HQADVW2ZgEnmBhSV1YxrfEcoEY3fMprGp5y5te0GqFjNkQKq0tmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741726398; c=relaxed/simple;
	bh=9OrXFzCU9t/CgrV3HIlzqZWxqLR83l5qSfuvQxQy3uI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g7EUhrXx+8U6MZxQbL6I1oKNPIUSfco3iPuDN3ZQZ1HXpyH58fV91p6s2FMATaL6sBGIaMfjWVlo9RL0LWBl2EbYfGvBLNAHFYkEc8vF+uYGZDF7z+kq61evWEqUqh3T6nnqDfqXvJK+9TBtTPg+8/FtdL9Qy1LPwjehzNuwliY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com; spf=pass smtp.mailfrom=sapience.com; dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b=Lx4reNC1; dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b=P0IDCt1D; arc=fail smtp.client-ip=72.84.236.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sapience.com
Authentication-Results: dkim-srvy7; dkim=pass (Good ed25519-sha256 
   signature) header.d=sapience.com header.i=@sapience.com 
   header.a=ed25519-sha256; dkim=pass (Good 2048 bit rsa-sha256 signature) 
   header.d=sapience.com header.i=@sapience.com header.a=rsa-sha256
Received: from srv8.sapience.com (srv8.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by s1.sapience.com (Postfix) with ESMTPS id 12C24480990;
	Tue, 11 Mar 2025 16:53:15 -0400 (EDT)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1741726394;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=unAz81NaH6Q0mbUeeW3P2rhL8/mSvXlVEJ/Ne2XlqrY=;
 b=Lx4reNC12oQwXuf32d9CWeW6sd7SdofOzMeSMkGEOSWwXSRVgS9fNBSfeVT0yuay5Xoff
 xDXzN2BtngoV6k4DA==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1741726394;
	cv=none; b=YD38t0C5VqH5EwHUsd45viub+qFDn6k86oa9vT1lbHcBNKjk/NZIgcZBUHrGnlUeQVre00wS+JUpZuhS8J+8hkPf8Km8S5PHOmANhuQG6BZvKpDK3BEI0tNhaBRD89iH9mmE7kUnouJqNQ8fTb4XyVUl66Q66P/jKv/6mq/9YKD+F5BW4RGRZByHam8gDYKo5KO9/RpW2erbBNldjgyQ8RxJoaHrf4O8XlrNGq1FiW7mWg4OvBdJm6d1+li+mAQfMldqjPS2FGb7bqFY72DtqxGXah+bJFKv6qUW5THo9z2pCziMaeUo7aKa0ao8I9YVHDYgLhyGpThuOy/v9O78Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1741726394; c=relaxed/simple;
	bh=9OrXFzCU9t/CgrV3HIlzqZWxqLR83l5qSfuvQxQy3uI=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=jwcbhk0uUJAnvcKkOG4WW8VcR2a1aGBEaGAMUAn5FhiQ5Gj3Rw7oNQvZdMG8rnqJWLajbyN61XCKkWtzB8eukvqCmMsm/6NJ2uQANEeqcXzKLRkUwJClGRE00yXY5SkCZXBMihJMQjh0R52GUZDLW7wcT5zaZUOkv4V2joSPi9V9XJutE//hFQJir8xu991M7XjNGIH1vRL8+edkQLvB+2QwKR3yRU7MyO12bVMkaXc450hz+fuxMaiEFHtMR8KqdH/NBJg3xeypajyXGbHHNi/GwNQuXFKhjjiIrgbQAnchDdh4nnbZ6FR48KKXBCTFWi7xnjyBSj8sqLzsTMgV5g==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1741726394;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=unAz81NaH6Q0mbUeeW3P2rhL8/mSvXlVEJ/Ne2XlqrY=;
 b=P0IDCt1DEDTPMup2usedmLcyToDe3/NYavU5x+7KGiFN4+ktVy5HeY8SdKPrLRe2FMVmG
 ICsQE7l5aTA18o3Df5fCbIEZ8jE0Q7bMqx+9xsTp0TDgG35wIwX6rO8OKEvwPcsdiQBO0m9
 alDp6VpJNrlzxpe5TllFF/g+7rJJUkbX5jsy7B9VhCmx/uqiKjXV3hWsLsxr2lb+VUkIzNJ
 FrSyINZ0zqB9RRIdrUNBEQBv89ccpYR4P+q4rXovtkRffTUMQiKJrE/G0QUQNoFddZ0/WFc
 EwU4ootqx0nzlFyHI78LtfIgt90mCsUUGYZp3aHZdipIN/knJo8AlFoiRJxg==
Received: by srv8.prv.sapience.com (Postfix) id CD7AC28003C;
	Tue, 11 Mar 2025 16:53:14 -0400 (EDT)
Message-ID: <bb1d612b61d572cf678e416d3a2cfabd5ccdc07a.camel@sapience.com>
Subject: Re: [PATCH] gpiolib: don't check the retval of get_direction() when
 registering a chip
From: Genes Lists <lists@sapience.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
	 <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Date: Tue, 11 Mar 2025 16:53:14 -0400
In-Reply-To: <20250311175631.83779-1-brgl@bgdev.pl>
References: <20250311175631.83779-1-brgl@bgdev.pl>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-feiO82EKrMkbu5CldaHu"
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-feiO82EKrMkbu5CldaHu
Content-Type: multipart/alternative; boundary="=-Q8R93X/jyPZjhGfIl4Ba"

--=-Q8R93X/jyPZjhGfIl4Ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2025-03-11 at 18:56 +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> During chip registration we should neither check the return value of
> gc->get_direction() nor hold the SRCU lock when calling it. The
> former
> is because pin controllers may have pins set to alternate functions
> and
> return errors from their get_direction() callbacks. That's alright -
> we
> should default to the safe INPUT state and not bail-out. The latter
> is
> not needed because we haven't registered the chip yet so there's
> nothing
> to protect against dynamic removal. In fact: we currently hit a
> lockdep
> splat. Revert to calling the gc->get_direction() callback directly
> and
> *not* checking its value.


Tested-by: Gene C <arch@sapience.com>


>=20
> Fixes: 9d846b1aebbe ("gpiolib: check the return value of
> gpio_chip::get_direction()")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes:
> https://lore.kernel.org/all/81f890fc-6688-42f0-9756-567efc8bb97a@samsung.=
com/
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Link:
> https://lore.kernel.org/r/20250226-retval-fixes-v2-1-c8dc57182441@linaro.=
org
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> This commit is in linux-next as 9becde08f1bc ("gpiolib: don't use
> gpiochip_get_direction() when registering a chip") and was applied as
> a fix to commits e623c4303ed1 ("gpiolib: sanitize the return value of
> gpio_chip::get_direction()") and 9d846b1aebbe ("gpiolib: check the
> return
> value of gpio_chip::get_direction()"). Becuase the former is queued
> for
> v6.15-rc1, this fix was never applied to v6.14 and sent upstream.
>=20
> However, the warning it addresses is now queued for v6.14. I've
> rebased
> this commit on top of v6.14-rc6 and would like to send it upstream.
> Once
> merged, I'll pull v6.14-rc7 back into my for-next branch and fix the
> conflicts.
>=20
> =C2=A0drivers/gpio/gpiolib.c | 27 +++++++++++----------------
> =C2=A01 file changed, 11 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 8741600af7ef..de708d081858 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1056,24 +1056,19 @@ int gpiochip_add_data_with_key(struct
> gpio_chip *gc, void *data,
> =C2=A0
> =C2=A0 desc->gdev =3D gdev;
> =C2=A0
> - if (gc->get_direction && gpiochip_line_is_valid(gc,
> desc_index)) {
> - ret =3D gc->get_direction(gc, desc_index);
> - if (ret < 0)
> - /*
> - * FIXME: Bail-out here once all GPIO
> drivers
> - * are updated to not return errors in
> - * situations that can be considered
> normal
> - * operation.
> - */
> - dev_warn(&gdev->dev,
> - "%s: get_direction failed:
> %d\n",
> - __func__, ret);
> -
> - assign_bit(FLAG_IS_OUT, &desc->flags, !ret);
> - } else {
> + /*
> + * We would typically want to check the return value
> of
> + * get_direction() here but we must not check the
> return value
> + * and bail-out as pin controllers can have pins
> configured to
> + * alternate functions and return -EINVAL. Also:
> there's no
> + * need to take the SRCU lock here.
> + */
> + if (gc->get_direction && gpiochip_line_is_valid(gc,
> desc_index))
> + assign_bit(FLAG_IS_OUT, &desc->flags,
> + =C2=A0=C2=A0 !gc->get_direction(gc,
> desc_index));
> + else
> =C2=A0 assign_bit(FLAG_IS_OUT,
> =C2=A0 =C2=A0=C2=A0 &desc->flags, !gc-
> >direction_input);
> - }
> =C2=A0 }
> =C2=A0
> =C2=A0 ret =3D of_gpiochip_add(gc);

--=20
Gene


--=-Q8R93X/jyPZjhGfIl4Ba
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>On Tue, 2025-03-11 at 18:56 +0100, Bartosz Golasz=
ewski wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bor=
der-left:2px #729fcf solid;padding-left:1ex"><div>From: Bartosz Golaszewski=
 &lt;<a href=3D"mailto:bartosz.golaszewski@linaro.org">bartosz.golaszewski@=
linaro.org</a>&gt;<br></div><div><br></div><div>During chip registration we=
 should neither check the return value of<br></div><div>gc-&gt;get_directio=
n() nor hold the SRCU lock when calling it. The former<br></div><div>is bec=
ause pin controllers may have pins set to alternate functions and<br></div>=
<div>return errors from their get_direction() callbacks. That's alright - w=
e<br></div><div>should default to the safe INPUT state and not bail-out. Th=
e latter is<br></div><div>not needed because we haven't registered the chip=
 yet so there's nothing<br></div><div>to protect against dynamic removal. I=
n fact: we currently hit a lockdep<br></div><div>splat. Revert to calling t=
he gc-&gt;get_direction() callback directly and<br></div><div>*not* checkin=
g its value.<br></div></blockquote><div><br></div><div><br></div><div>Teste=
d-by: Gene C &lt;<a href=3D"mailto:arch@sapience.com">arch@sapience.com</a>=
&gt;</div><div><br></div><div><br></div><blockquote type=3D"cite" style=3D"=
margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div><br=
></div><div>Fixes: 9d846b1aebbe ("gpiolib: check the return value of gpio_c=
hip::get_direction()")<br></div><div>Reported-by: Marek Szyprowski &lt;<a h=
ref=3D"mailto:m.szyprowski@samsung.com">m.szyprowski@samsung.com</a>&gt;<br=
></div><div>Closes: <a href=3D"https://lore.kernel.org/all/81f890fc-6688-42=
f0-9756-567efc8bb97a@samsung.com/">https://lore.kernel.org/all/81f890fc-668=
8-42f0-9756-567efc8bb97a@samsung.com/</a><br></div><div>Reviewed-by: Andy S=
hevchenko &lt;<a href=3D"mailto:andriy.shevchenko@linux.intel.com">andriy.s=
hevchenko@linux.intel.com</a>&gt;<br></div><div>Tested-by: Marek Szyprowski=
 &lt;<a href=3D"mailto:m.szyprowski@samsung.com">m.szyprowski@samsung.com</=
a>&gt;<br></div><div>Link: <a href=3D"https://lore.kernel.org/r/20250226-re=
tval-fixes-v2-1-c8dc57182441@linaro.org">https://lore.kernel.org/r/20250226=
-retval-fixes-v2-1-c8dc57182441@linaro.org</a><br></div><div>Signed-off-by:=
 Bartosz Golaszewski &lt;<a href=3D"mailto:bartosz.golaszewski@linaro.org">=
bartosz.golaszewski@linaro.org</a>&gt;<br></div><div>---<br></div><div>This=
 commit is in linux-next as 9becde08f1bc ("gpiolib: don't use<br></div><div=
>gpiochip_get_direction() when registering a chip") and was applied as<br><=
/div><div>a fix to commits e623c4303ed1 ("gpiolib: sanitize the return valu=
e of<br></div><div>gpio_chip::get_direction()") and 9d846b1aebbe ("gpiolib:=
 check the return<br></div><div>value of gpio_chip::get_direction()"). Becu=
ase the former is queued for<br></div><div>v6.15-rc1, this fix was never ap=
plied to v6.14 and sent upstream.<br></div><div><br></div><div>However, the=
 warning it addresses is now queued for v6.14. I've rebased<br></div><div>t=
his commit on top of v6.14-rc6 and would like to send it upstream. Once<br>=
</div><div>merged, I'll pull v6.14-rc7 back into my for-next branch and fix=
 the<br></div><div>conflicts.<br></div><div><br></div><div>&nbsp;drivers/gp=
io/gpiolib.c | 27 +++++++++++----------------<br></div><div>&nbsp;1 file ch=
anged, 11 insertions(+), 16 deletions(-)<br></div><div><br></div><div>diff =
--git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c<br></div><div>index=
 8741600af7ef..de708d081858 100644<br></div><div>--- a/drivers/gpio/gpiolib=
.c<br></div><div>+++ b/drivers/gpio/gpiolib.c<br></div><div>@@ -1056,24 +10=
56,19 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,<b=
r></div><div>&nbsp;<br></div><div>&nbsp;<span class=3D"Apple-tab-span" styl=
e=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" style=3D"white=
-space:pre">	</span>desc-&gt;gdev =3D gdev;<br></div><div>&nbsp;<br></div><=
div>-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span=
 class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if (gc-&gt;get_=
direction &amp;&amp; gpiochip_line_is_valid(gc, desc_index)) {<br></div><di=
v>-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span c=
lass=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span class=3D"Ap=
ple-tab-span" style=3D"white-space:pre">	</span>ret =3D gc-&gt;get_directio=
n(gc, desc_index);<br></div><div>-<span class=3D"Apple-tab-span" style=3D"w=
hite-space:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-space=
:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</s=
pan>if (ret &lt; 0)<br></div><div>-<span class=3D"Apple-tab-span" style=3D"=
white-space:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-spac=
e:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</=
span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>/*<br=
></div><div>-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</sp=
an><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span c=
lass=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span class=3D"Ap=
ple-tab-span" style=3D"white-space:pre">	</span> * FIXME: Bail-out here onc=
e all GPIO drivers<br></div><div>-<span class=3D"Apple-tab-span" style=3D"w=
hite-space:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-space=
:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</s=
pan><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * are=
 updated to not return errors in<br></div><div>-<span class=3D"Apple-tab-sp=
an" style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" style=
=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-=
space:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre"=
>	</span> * situations that can be considered normal<br></div><div>-<span c=
lass=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span class=3D"Ap=
ple-tab-span" style=3D"white-space:pre">	</span><span class=3D"Apple-tab-sp=
an" style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" style=
=3D"white-space:pre">	</span> * operation.<br></div><div>-<span class=3D"Ap=
ple-tab-span" style=3D"white-space:pre">	</span><span class=3D"Apple-tab-sp=
an" style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" style=
=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-=
space:pre">	</span> */<br></div><div>-<span class=3D"Apple-tab-span" style=
=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-=
space:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre"=
>	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>d=
ev_warn(&amp;gdev-&gt;dev,<br></div><div>-<span class=3D"Apple-tab-span" st=
yle=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" style=3D"whi=
te-space:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-space:p=
re">	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</spa=
n><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> "%s: ge=
t_direction failed: %d\n",<br></div><div>-<span class=3D"Apple-tab-span" st=
yle=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" style=3D"whi=
te-space:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-space:p=
re">	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</spa=
n><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> __func_=
_, ret);<br></div><div>-<br></div><div>-<span class=3D"Apple-tab-span" styl=
e=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" style=3D"white=
-space:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre=
">	</span>assign_bit(FLAG_IS_OUT, &amp;desc-&gt;flags, !ret);<br></div><div=
>-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span cl=
ass=3D"Apple-tab-span" style=3D"white-space:pre">	</span>} else {<br></div>=
<div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><spa=
n class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>/*<br></div><d=
iv>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * We would typi=
cally want to check the return value of<br></div><div>+<span class=3D"Apple=
-tab-span" style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span> * get_direction() here but we must not =
check the return value<br></div><div>+<span class=3D"Apple-tab-span" style=
=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-=
space:pre">	</span> * and bail-out as pin controllers can have pins configu=
red to<br></div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:p=
re">	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</spa=
n> * alternate functions and return -EINVAL. Also: there's no<br></div><div=
>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span cl=
ass=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * need to take th=
e SRCU lock here.<br></div><div>+<span class=3D"Apple-tab-span" style=3D"wh=
ite-space:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-space:=
pre">	</span> */<br></div><div>+<span class=3D"Apple-tab-span" style=3D"whi=
te-space:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-space:p=
re">	</span>if (gc-&gt;get_direction &amp;&amp; gpiochip_line_is_valid(gc, =
desc_index))<br></div><div>+<span class=3D"Apple-tab-span" style=3D"white-s=
pace:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>as=
sign_bit(FLAG_IS_OUT, &amp;desc-&gt;flags,<br></div><div>+<span class=3D"Ap=
ple-tab-span" style=3D"white-space:pre">	</span><span class=3D"Apple-tab-sp=
an" style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" style=
=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-=
space:pre">	</span>&nbsp;&nbsp; !gc-&gt;get_direction(gc, desc_index));<br>=
</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</spa=
n><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>else<br>=
</div><div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><sp=
an class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>assign_bit(FL=
AG_IS_OUT,<br></div><div>&nbsp;<span class=3D"Apple-tab-span" style=3D"whit=
e-space:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-space:pr=
e">	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span=
><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>&nbsp;&nb=
sp; &amp;desc-&gt;flags, !gc-&gt;direction_input);<br></div><div>-<span cla=
ss=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span class=3D"Appl=
e-tab-span" style=3D"white-space:pre">	</span>}<br></div><div>&nbsp;<span c=
lass=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br></div><div>&=
nbsp;<br></div><div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-spa=
ce:pre">	</span>ret =3D of_gpiochip_add(gc);<br></div></blockquote><div><br=
></div><div><span><pre>-- <br></pre><div><span style=3D"background-color: i=
nherit;">Gene</span></div><div><br></div></span></div></body></html>

--=-Q8R93X/jyPZjhGfIl4Ba--

--=-feiO82EKrMkbu5CldaHu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ9CiugAKCRA5BdB0L6Ze
26AxAQDWqjP9Dhratr6IsJZ26DrzG4ojoBuXzynrvvkgwggJaAD/Wkw0criuYJfy
he4zJRnSYj77frc81Mc+3ZlFV1OPSwg=
=6Z4n
-----END PGP SIGNATURE-----

--=-feiO82EKrMkbu5CldaHu--

