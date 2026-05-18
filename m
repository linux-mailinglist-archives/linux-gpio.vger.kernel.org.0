Return-Path: <linux-gpio+bounces-37003-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aF65EeN7Cmqe1wQAu9opvQ
	(envelope-from <linux-gpio+bounces-37003-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 04:39:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB21256523A
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 04:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8A94F3002313
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 02:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664502475E3;
	Mon, 18 May 2026 02:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAoWKzTM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB1C2D0602
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 02:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779071966; cv=pass; b=eSsaOgiot6jpe22oxBkX0bjZEkj2VucykC0b2awHSsiiQx4rmkzsH0Q456XPkewS6OZQ97p2maWjOgVKXJmqAlO4260Usv15M1Gmro/YrhvBuyB9bOoj7bST6DJdvhpeL6dhrM2eSNvKUo7l2qwBsPvoTTGXuF1/M8eTbLTS+aM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779071966; c=relaxed/simple;
	bh=Ez7FsfYdRBuDV9VsJ/QsP/mS0cTzmxNd+ivitbeBFwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A6XVRI2Xqkno20wBu8NxEue8zY18q8EpDdXC2rVqlC1NT0MJI0Db000JRAhVY+x1EnXw/qNkhKbJe2bHnRYeLY+kvbOaNHgo8TmNZS8EVlzGIyMs7k1UMcz3pVDnrSsW3s88T9ddl18IbC67tzsGrHdsZxzX7MRoVI6Rt/GcGV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAoWKzTM; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67cac5ece75so3861642a12.2
        for <linux-gpio@vger.kernel.org>; Sun, 17 May 2026 19:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779071963; cv=none;
        d=google.com; s=arc-20240605;
        b=S9xHwnv3onBl7kcg+7WucSGpLI3VQKeiSFyadlGht8TWqRT3St11pxJjHgBp4QqOIh
         PpnKxNVnxls6zgEtgTxWmT62G/wku40F9VAcKq1MTFrcT4bJz5MJwOJ3lpdgItboSI94
         X17L8ldqWxI7sQktGl7OyO6q+bka4tkEieGeS+NuB00mIKFcfIHealr0zjMT5rf9Yyfl
         mHPPEaabR/Bc6CMlbYuU442RxywB0YiIDDd99ybwSlRNe+bYaMozkzvwd2fhSKhfnwJp
         U0vJvxrfcNx2CGT/PTi/ypN045e9xogXE0VXhI8g+iJGq6784Wv2LdWSl/c2sa9cfUQD
         3Q8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+KVBTsjWVsXH7/FkzqpUy1kZWPM9AqvC7WFZ8Aad8JA=;
        fh=BWVfIznVMo87J/ODyf79Q+jwVBV09W9FukB4ZOBWsNM=;
        b=dvO4/vwtyUrG67/ATlsT/xXhfmobNqkhHMxo3cgAdqgNXp06S+oIZdPz6qAx+/b04n
         usrtbqQ4mnsupboF/5RflbPJkD1/XTfxsCJcCXPZa6BPlp1LCabLoI2VjKRdMp1sv3Ug
         2PLZHWYHksvDL9C/qsWSBUlrH1neTX2IVaUYcbsUiUcNBrDWRYouu/apya1vcknfWbti
         kEL7Ut9OOWKfNnOUZjnXnqPoC2bhwgjfV18woxsvPPIQ4+PdQduMZgtaq8LKAKYWKF31
         zfeEqndwCpuBAzg92reR5alu9rLWVxYt3MNLhRRhpuR5mNkManQcElLhabWuacyG19MX
         MGBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779071963; x=1779676763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KVBTsjWVsXH7/FkzqpUy1kZWPM9AqvC7WFZ8Aad8JA=;
        b=EAoWKzTMxmPqDDfC9r8FgQkzIExQRnI95omZUYBn6/Vn9oyEDscABEKAwyEggwnLwS
         C8pdXdBfnT1rVDY9PQwkCopRszEsaqSBVZVQVI2sy8wdIkpJc496amm3sNrU2Vo0vT9I
         igYv6UKdpbh8LhyV5jG/s7VoEQAlmLgr42N2X2BTyILMt4/hRK22xPBuXWhwLVGiOn0b
         C9VSYfTVJlWTi4KDIaroJcdOFdAnoeDPlRanUB3a+VIDQqKNFKkJe3aM5ShisNoySuwh
         gdCoaBuBvJEsiDhknG36gG/AZnL89U0X630BXyend2W0aa9IaFePUjBFD54pVlOQ4HLz
         OUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779071963; x=1779676763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+KVBTsjWVsXH7/FkzqpUy1kZWPM9AqvC7WFZ8Aad8JA=;
        b=CGhz+jogXCzn+Kpwl13foe3/n9dt98QbwCF3qdBuHnzrqfGQumPZDACLU7eiN4OCEh
         XS8FAikPMghr2utsvcf3hMDAL4nNVTjku11+HGioTB6dh6efN6SwMrVZ4RpW35NrD1Zq
         7wpv7dkzEEhfNR1FYybjg2d/UWddtFgm1zh6oWOLoLzEP2v2ph+Gk65jg0SHO82plbcB
         3YVAoSCIfLmX8L1TJMT3PgRVJPZhc3bZPC4WNQVJcrSEOa5mHZa0kEUiTmQQfQqz1lCg
         Bw00tfPOxJiF49DnwuGLPhxoN6E2ItgTrzpvIkYmYZCQDdkBbyJCp63EB2aJNilGZ01q
         lIqg==
X-Forwarded-Encrypted: i=1; AFNElJ+Kh1u3kzMtQ5tPFRv/N1aRW/tnOtcsNRw5VskVgdU+yKytn9emgbiAnuR35q/GOKsP/AvPkCOKvF9g@vger.kernel.org
X-Gm-Message-State: AOJu0YydUvdfiAogN61nw2dNSJ2xfizdg+UndWkJNfzbovgIZvpItKjA
	6ls8mTuAXxU6/wf9DWB03WQWRyBhIHzgZfTm5XvTJxzahjTSlVcAE2KXc9Wk9xzt2wCoghXVl1f
	V+ihaxcAFx1lVtB0q9Tp4AhbcrPmX1cc=
X-Gm-Gg: Acq92OE7VuipMHqR2XhmEG5iLEfAE1CWIzI97ODdLBmEU7V3rrCAIfwX6AqeZBd2xD+
	0s8M5mrqjp130Indw1wvjlqeqOfpppUWHuqONbIleWdnUbUkyAjFdcd4In4/W1g7jBXANsuFz01
	LajemntnXmzPOvHS7/IsodbsUXGc5dm8ddaXRiQZZdQ7/qbAhbsEw2nIKXjjTk0giBNq+4UaKWP
	gX41BqCBtuij93TKyWDi/XkTIYr5x8yCfpE3QNlEiaqMAPWqqWftIqnKBv823Xg+oCC8kRG4mHQ
	V4VzIOmy0L1XP5ZqNeViVNITzzTo2cKe85DV8XrR6I4mjlpw2tSW/j5ZBWzsi7MG77ZAb4dJ4TM
	LRMO1BkpVfVZXq0JutJX1rzuMNSS2vifWNiIQO/B+UOXNqNTTugwCehCb8Q==
X-Received: by 2002:a17:907:8b98:b0:bd3:413d:c51a with SMTP id
 a640c23a62f3a-bd5178848demr676428366b.17.1779071962572; Sun, 17 May 2026
 19:39:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518-jh7110-v1-0-fdb0daae5a4b@kernel.org> <20260518-jh7110-v1-2-fdb0daae5a4b@kernel.org>
In-Reply-To: <20260518-jh7110-v1-2-fdb0daae5a4b@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 17 May 2026 19:39:10 -0700
X-Gm-Features: AVHnY4Idk9jCpV-zhG8adjTBTd5fcWR3AHwRvmwB0i1OrPWizj_xM6iKDb1FHVE
Message-ID: <CAKxU2N9jD5Mj+ZeQbtQV+hJ5zknEbVOiniGUdJysFOSLTzMKEw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: starfive: jh7110: Avoid ifdeffery
To: Linus Walleij <linusw@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: DB21256523A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37003-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 4:01=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Use IS_ENABLED() inline assigning a variable instead of ifdeffery.
>
> Cc: Rosen Penev <rosenp@gmail.com>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Link: https://lore.kernel.org/linux-gpio/CAMuHMdX7t7VHTzybjYo3s8SU3XLEH9G=
KsxmLBbh7p4D1CT3H_Q@mail.gmail.com/
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers=
/pinctrl/starfive/pinctrl-starfive-jh7110.c
> index 3fb9aa8ddf07..ec359cb873c4 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> @@ -845,6 +845,7 @@ int jh7110_pinctrl_probe(struct platform_device *pdev=
)
>         struct jh7110_pinctrl *sfp;
>         struct pinctrl_desc *jh7110_pinctrl_desc;
>         struct reset_control *rst;
> +       unsigned int num_saved_regs;
>         struct clk *clk;
>         int ret;
>
> @@ -857,15 +858,12 @@ int jh7110_pinctrl_probe(struct platform_device *pd=
ev)
>                 return -EINVAL;
>         }
>
> -#if IS_ENABLED(CONFIG_PM_SLEEP)
> -       sfp =3D devm_kzalloc(dev, struct_size(sfp, saved_regs, info->nsav=
ed_regs),
> -                       GFP_KERNEL);
> -#else
> -       sfp =3D devm_kzalloc(dev, sizeof(*sfp), GFP_KERNEL);
> -#endif
> +       num_saved_regs =3D IS_ENABLED(CONFIG_PM_SLEEP) ? info->nsaved_reg=
s : 0;
> +       sfp =3D devm_kzalloc(dev, struct_size(sfp, saved_regs, num_saved_=
regs),
> +                          GFP_KERNEL);
>         if (!sfp)
>                 return -ENOMEM;
> -       sfp->num_saved_regs =3D info->nsaved_regs;
> +       sfp->num_saved_regs =3D num_saved_regs;
yeah and this is used absolutely nowhere. Both for loops are of the form

for (i =3D 0 ; i < sfp->info->nsaved_regs ; i++)

I really don't think __counted_by is worth it here.
>
>         sfp->base =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(sfp->base))
>
> --
> 2.54.0
>

