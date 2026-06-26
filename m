Return-Path: <linux-gpio+bounces-39027-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lYuKAkpLPmo+CwkAu9opvQ
	(envelope-from <linux-gpio+bounces-39027-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 11:50:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 189E16CBD44
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 11:50:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=X4XWCEad;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39027-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39027-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 05D8A301FE31
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 09:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C58B53E9585;
	Fri, 26 Jun 2026 09:49:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAA33EAC71
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 09:49:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782467386; cv=none; b=DXQIrUjaGlsGKGoawvXmCJtrhEgAWzCVFOUZNsbyHFGSpVc9vk/nhZXgLwXeVh0wEqdWZE7Zac4iFAKIRR3goEPVHjY4/C+3Jn7RQmiPREkR8X6Yl9jMBi61ZQyUjY9xc+Y2capjWjWXlC/0Q+fWo1ImDzvBmHroogmik3/UUMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782467386; c=relaxed/simple;
	bh=SZ0kOd+kTUhQnvMcAs8+KhIa223vk2ZpXp1jJOulNpE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sk051Z6wmqCXlttRa90ggq9TU1Lp7CI90roU11FA7yKJk0y4yZmXzcclNtbeOtnDxbKG9gxOX6V/piqIQtjW+UzFMwaZAOGEvi1sPaTodEmeJ5/W2MFLvSLb02TmOEuUtu4yvOSp1Lx3ubmD1lcjVVQhxxO29iJu/OD42Ls9I2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X4XWCEad; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B231F00A3D
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 09:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782467385;
	bh=eRSl/vsh54k/DU0fVQAz2/geK0QvjuCFRE/XJNUJeXM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=X4XWCEad5AZtkvgm2sWbTAe8HZGaJWoY+0JLsS/bEbHuh1A+afGOmvFAPDWKrh3ve
	 28uRJRyDGT2U+MvvxlVyCJlH9WKI9L9QoPNvEK1Ra1AXP1AIOjnawdt904EOVGxQpc
	 DDP6KFvnekOB929xiJ84C1sn2Pd8ccowvPL4dl1VnbetIbQaJujg2n7R4dsLz4PL2G
	 UjGGRkfsWMF/dA9ydurBjdAvKoLZPHfFR/AJo2omWelp+/nid1l89550TEQIt671ev
	 PS5RA4IRCuXRs0wdFXwrPMhDh+pn2oAe0c2DHlQNzr+KFxNC3oGeneRPmMh1iuTmK5
	 hGlleJO46qeeQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39669bcaadfso7813731fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 02:49:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrMkxnHUqqMD1suV3XuDVaQFN6cmmOaIzJJtP03vCUdyGgKKI6UuIbO4Inh6uqTlXg3gLzcMh0XTHhr@vger.kernel.org
X-Gm-Message-State: AOJu0YwqelxYstTtm0at9PtcAO+4v5Y6p/bR21uuE7RlT7D9gueoHxHV
	LzLMtdrBRlFKTemOC4DIliYDq+IJDwNfAFw66hbo1uAX92W3Pikzfn78KNLCHL9diixT+B34kz0
	KNpwZiQ8e3XMyx2dpgEzH3lM3qhkNU70Mg02kzW37/w==
X-Received: by 2002:a05:651c:a084:b0:399:7511:1c21 with SMTP id
 38308e7fff4ca-39acb62e1f6mr12199991fa.16.1782467384045; Fri, 26 Jun 2026
 02:49:44 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jun 2026 05:49:40 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jun 2026 05:49:40 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260624131645.86884-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624131645.86884-1-pengpeng@iscas.ac.cn>
Date: Fri, 26 Jun 2026 05:49:40 -0400
X-Gmail-Original-Message-ID: <CAMRc=MeMa3=OjtVTwHETH+CseOTSpGZdVRUrj6DMrUJ-x6Tt0Q@mail.gmail.com>
X-Gm-Features: AVVi8Ce4vaz8rnbV6pmF4RcwaLH8hSjheFPXQkTFzf0wH9caIYuIlDVmtBnX-Ck
Message-ID: <CAMRc=MeMa3=OjtVTwHETH+CseOTSpGZdVRUrj6DMrUJ-x6Tt0Q@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: mvebu: fail probe if gpiochip registration fails
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, 
	Jason Cooper <jason@lakedaemon.net>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39027-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:arnd@arndb.de,m:thomas.petazzoni@free-electrons.com,m:jason@lakedaemon.net,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 189E16CBD44

On Wed, 24 Jun 2026 15:16:45 +0200, Pengpeng Hou <pengpeng@iscas.ac.cn> said:
> mvebu_gpio_probe() registers the GPIO chip with
> devm_gpiochip_add_data() but ignores the return value. If registration
> fails, probe continues and leaves later code operating on a GPIO chip
> that was never published to gpiolib.
>
> Return the registration error so the device fails probe cleanly.
>
> Fixes: fefe7b092345 ("gpio: introduce gpio-mvebu driver for Marvell SoCs")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> Changes since v2:
> https://lore.kernel.org/all/20260622153137.69065-1-pengpeng@iscas.ac.cn/
> - Add the Fixes tag requested by Bartosz Golaszewski.

Please include the entie changelog with all versions in the future.

Bart

>
>  drivers/gpio/gpio-mvebu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
> index c030d1f00abc..689dc6354c2d 100644
> --- a/drivers/gpio/gpio-mvebu.c
> +++ b/drivers/gpio/gpio-mvebu.c
> @@ -1221,7 +1221,10 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
>  		BUG();
>  	}
>
> -	devm_gpiochip_add_data(&pdev->dev, &mvchip->chip, mvchip);
> +	err = devm_gpiochip_add_data(&pdev->dev, &mvchip->chip, mvchip);
> +	if (err)
> +		return dev_err_probe(&pdev->dev, err,
> +				     "failed to register gpiochip\n");
>
>  	/* Some MVEBU SoCs have simple PWM support for GPIO lines */
>  	if (IS_REACHABLE(CONFIG_PWM)) {
> --
> 2.50.1 (Apple Git-155)
>
>

