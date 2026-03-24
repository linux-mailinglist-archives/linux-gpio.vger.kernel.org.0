Return-Path: <linux-gpio+bounces-34090-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HvcMJa0wmkvlAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34090-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 16:58:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5843D318786
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 16:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA3A23045E04
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 15:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72983366565;
	Tue, 24 Mar 2026 15:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tKuDR9LJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D713630BB
	for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 15:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774367531; cv=pass; b=K5ynQ96ACI4+CjxRWPQdcGVqk4x00MKAZN4kiKO30anGBg53SHnaRjsdNyAR5JrRbnWRhgO6j7yiDsW/e1M4su32u3K3Qgaop4FZUaaVD7IZT8rUOipZvepSWNb3S4grdC7bVTEmsUwrAblNp/d1+cWCP9qYEKuJL0OSmZqJPVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774367531; c=relaxed/simple;
	bh=MeB5P/o+6ukbkA61NR67lkTMMytZ8ZhzDzkbS6f7sZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M5qSPWaQJqxeNfHjaPPMSAOH2mEVBCRg9cgE5saFPFRWaEKH8/coOOaFdEk/WGnGqhMcs4yVNydO+yNdtkxh6HBLouU/6MCBRtN9SkxpCEK+P6tFKSRIlK8U9j9qp0w8+v127LTJ9IR4uoGH/YLO+Jh9wvbTfXDMDHJijYXpNIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tKuDR9LJ; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9825ba7f9dso3196466b.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 08:52:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774367528; cv=none;
        d=google.com; s=arc-20240605;
        b=WJxoLTTbMLNroF1TiX5qJf7T9kwbWaXM7vmW0nAZThtzpmUXuxU+5hAamtqN+eesWn
         sYxtgI1UxPWUtCR8FrD02B/579SZiGE0qLrS20LS06PEhpyTQKA3agPcyq+XBUgF1PRy
         w3o8Vy1Bd+936j7Y0dXoyt9P7YYE3eAg2OtT4WRuuPDvYcDPO+4lzabh3uRZg41jD+7X
         NMRerJ65vkpJ0yhx3yZDZif/qBa5dohnZzYGMbXt3Yg5XDN925HzqAAQYdHlrOZZkija
         /xLbMQxwJRMK0fu9VIRP+MIRHeDnjgi0tp5/0xUsDOZKrFtidDRcwMyyKZm/ktxu3JDk
         NChA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lD7l9bDtZUKA/Q1Nlb2bt3XnckUYIqjo8i1RjZDuiQU=;
        fh=io43wJQ4nmgNkVHEzPrwdpW+5DvsiUM3ODwg2l3+IFI=;
        b=dfDIQRQC3qdxAZxBV9NLGAJJC0zKXaqzOaoBdVfXJIfgwhRzdEarNFMPt4GIovvl2z
         rzzmcOY7PUBTlpxxO7QsuadKInKJsExQkgC5NNTpLogFzAi7fTd4keMcft6vhDZfUHOX
         9TohHpOgvsMslKLRO7gXciTnWZqzR0qXUYS4AvcmP3KnkM/sAG6BpH1AKV9CG/LZFwqb
         Th1TLBE3pblvidh7qYIQssqvRsBpbkxksnIRtWZKnIWBgny2uWAP+JltA1Lx7ZS43/GN
         MjAvPDoHUSrzmzyts/uiA5Dsa16HJ8J/myGE+DvZcHmC31SOjf1+ykAZu1XgDHJMZ1GZ
         oIww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774367528; x=1774972328; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lD7l9bDtZUKA/Q1Nlb2bt3XnckUYIqjo8i1RjZDuiQU=;
        b=tKuDR9LJvdkt8/vPynnMgaP4vLMCFbdoG1nlhonK97Jq5LZDwph8mGbKcs0Thii4Oj
         h1on/ZNLx8vK4jdkFP5KXP3OiNdIavPfyvPB7a1fvdu5sgfi72VrnV2GiMI5N3GV7BtB
         mDun79UU/fTByv1Q9w64/XrunbddSSA/u6tN0irJFjb5MptDQLh2QxLKmEdDteoWrU8p
         spyBlcN9IN7o3vC5OOH5jcQiXDSrbTRiLoAxQap89LHTFVUtV9Npyizrq2NHdx83OhsR
         DaWPw1+JA0RFGqjorbK9D79SN0SfoyZrfcZ6RgJezX5TQX0gen17lkwZwuj6P8tV5z5W
         1McA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774367528; x=1774972328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lD7l9bDtZUKA/Q1Nlb2bt3XnckUYIqjo8i1RjZDuiQU=;
        b=I/UbF0qVl/3SYP7MWn1iKPoPE5CvmkzR8irwagc1q/XfXN8Hf+RsWp8UUyqnUFCbrK
         GGx6H4tj59aIoy8ycHLeYgsceFpBxnjBwdKP8LOE7d37GXwdCKxhbRZFyor7nM4dpBh4
         7WZSkMAp78ndOcfBMcWVPX9V4dIJ1jZ3/hhFiDiBPS39OiXUNrueJMP59DJECkcX6wNG
         qUoaerCeLReTStCUOmp7UTfYUld0AXAMEonsRh6U9GonDdyh6xpO/D8gr5sonj11BD7R
         WQLYhUtbtjtUG5DnHe3RXtBlCnMOce6nC8sB3P/lfBfpbN52pimg23j5i9uM+UBfqZ+n
         DFCA==
X-Forwarded-Encrypted: i=1; AJvYcCWICCTzJ2zYUUjGmXpoBuntpCZHlcjfZox/2L8sHfyVEZfny/0qSssLw3ITJhK0APsCEYyzq26nr1HY@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ9/MvQy8molUkzYTZFjpOzOWc7ETIqyqAHK+gdCfV3zup25fi
	CtTyI/JKWKsuzer8FfsAd09ShneQCKJ8+WmH3DX7bY+0/Idh/pHz+nwtqlj57WtpS5xzrCA1uis
	jfGmKCh+mSHx5De2mklWDheCK62BGm8A=
X-Gm-Gg: ATEYQzwVM5f8pi7UgjCl7hyPbzoF/QQJ+UGe9K12aXmIZhck6jW9+h5WjrJ1PFU3vsT
	CkGnu/rGEbwuhbLZ5naSu6SJlaAsz0euA7+k18s/TAoFhbCw7eLmP/kmOQJRyQ5LhuBpVRmwcao
	JxUSlSXTH0s/mBPkoG3p9oVd3zB6e/aLoZ2ob7vFviOHlxzG4eTqw8Ex7vjjCaPSNlMx1oWA5Ox
	9/1QDt1I8ga1n4PwVYXFQpvGOqWzOWCvvgqIZo8B7VzZYMyia3EU0cDRZK1KAwtpadsp6JN+Jnn
	lklVHXr46G5YXzP3jaqlag2AUP9jP3+eenKIewkqMIwidZntuUjxkgrLUeVWiz92DSSg3/WkRjN
	oYTAY5w==
X-Received: by 2002:a17:907:7b87:b0:b88:5b72:ec39 with SMTP id
 a640c23a62f3a-b988630badcmr241190966b.5.1774367527875; Tue, 24 Mar 2026
 08:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319000558.22108-1-rosenp@gmail.com> <202603201104.8D7B8A1@keescook>
 <CAKxU2N8ZZp5fcCWfMaqZ9VKwNQ3a06fsQPXpBQa-d1N07zPGng@mail.gmail.com>
 <CAMRc=MctGTeqBHQ8zaQ7_2YAoWoTUxOK4_hs+-EHEQEPnz+A-g@mail.gmail.com>
 <CAKxU2N9KdziPen9-_gfe0UZjyuMTOsbb583aeF3=kqm22rGieA@mail.gmail.com> <CAMRc=Me2RLj-vvCVNho9CPYVwsQHypC_KvKHJWkLyj=rMkfx2w@mail.gmail.com>
In-Reply-To: <CAMRc=Me2RLj-vvCVNho9CPYVwsQHypC_KvKHJWkLyj=rMkfx2w@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 24 Mar 2026 08:51:56 -0700
X-Gm-Features: AQROBzA3I7YQY7GsShXPNk_xQ1egepYa_RDQXlRXjm_maNSW7HaU5ezLIW7I0hk
Message-ID: <CAKxU2N8gudRXR-bLMoyDVDuv3vWuzqrbyVsHL=Gu3mDZWMvs6w@mail.gmail.com>
Subject: Re: [PATCH] gpio: mockup: allocate lines with main struct
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Kees Cook <kees@kernel.org>, linux-gpio@vger.kernel.org, 
	Bamvor Jian Zhang <bamv2005@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34090-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5843D318786
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 2:16=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Mon, 23 Mar 2026 17:43:00 +0100, Rosen Penev <rosenp@gmail.com> said:
> > On Mon, Mar 23, 2026 at 3:00=E2=80=AFAM Bartosz Golaszewski <brgl@kerne=
l.org> wrote:
> >>
> >> On Sat, Mar 21, 2026 at 12:00=E2=80=AFAM Rosen Penev <rosenp@gmail.com=
> wrote:
> >> >
> >> > >
> >> > > static int gpio_mockup_probe(struct platform_device *pdev)
> >> > > {
> >> > >         ...
> >> > >         u16 ngpio;
> >> > >         ...
> >> > >         rv =3D device_property_read_u16(dev, "nr-gpios", &ngpio);
> >> > >         ...
> >> > >         gc->ngpio =3D ngpio;
> >> > >         ...
> >> > >         chip->lines =3D devm_kcalloc(dev, gc->ngpio,
> >> > >                                    sizeof(*chip->lines), GFP_KERNE=
L);
> >> > >
> >> > > But this begs the question: why add nr_lines when ngpio is already=
 part
> >> > > of the struct:
> >> > Maintainers for some inexplicable reason want an extra variable for
> >> > __counted_by works.
> >>
> >> I believe what Kees means here is: you can use ngpio for __counted_by(=
) like so:
> >>
> >>   __counted_by(gc.ngpio)
> > __counted_by doesn't support nested variables like that.
> >
> > drivers/gpio/gpio-mockup.c:59:61: error: =E2=80=98gc=E2=80=99 undeclare=
d here (not in
> > a function)
> >    59 |         struct gpio_mockup_line_status lines[] __counted_by(gc.=
ngpio);
>
> The following spin on your patch builds fine for me:
>
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index a7d69f3835c1e..9427ab8c45f73 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -52,10 +52,10 @@ struct gpio_mockup_line_status {
>
>  struct gpio_mockup_chip {
>         struct gpio_chip gc;
> -       struct gpio_mockup_line_status *lines;
>         struct irq_domain *irq_sim_domain;
>         struct dentry *dbg_dir;
>         struct mutex lock;
> +       struct gpio_mockup_line_status lines[] __counted_by(gc.ngpio);
You're using an older compiler. This does not work at all.

 * Optional: only supported since gcc >=3D 15
 * Optional: only supported since clang >=3D 18
>  };
>
>  struct gpio_mockup_dbgfs_private {
> @@ -436,15 +436,16 @@ static int gpio_mockup_probe(struct platform_device=
 *pdev)
>         if (rv)
>                 name =3D dev_name(dev);
>
> -       chip =3D devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +       chip =3D devm_kzalloc(dev, struct_size(chip, lines, ngpio), GFP_K=
ERNEL);
>         if (!chip)
>                 return -ENOMEM;
>
> -       mutex_init(&chip->lock);
> -
>         gc =3D &chip->gc;
> -       gc->base =3D base;
>         gc->ngpio =3D ngpio;
> +       gc->base =3D base;
> +
> +       mutex_init(&chip->lock);
> +
>         gc->label =3D name;
>         gc->owner =3D THIS_MODULE;
>         gc->parent =3D dev;
> @@ -460,11 +461,6 @@ static int gpio_mockup_probe(struct platform_device =
*pdev)
>         gc->request =3D gpio_mockup_request;
>         gc->free =3D gpio_mockup_free;
>
> -       chip->lines =3D devm_kcalloc(dev, gc->ngpio,
> -                                  sizeof(*chip->lines), GFP_KERNEL);
> -       if (!chip->lines)
> -               return -ENOMEM;
> -
>         for (i =3D 0; i < gc->ngpio; i++)
>                 chip->lines[i].dir =3D GPIO_LINE_DIRECTION_IN;
>
> Bart

