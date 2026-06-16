Return-Path: <linux-gpio+bounces-38559-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TSuoMMYAMWouaQUAu9opvQ
	(envelope-from <linux-gpio+bounces-38559-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 09:52:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2620F68CF6A
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 09:52:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=MXFb+3CE;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38559-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38559-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A1FD3026F1E
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 07:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C958F3EDADF;
	Tue, 16 Jun 2026 07:48:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE4B29E0F6
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 07:48:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781596102; cv=none; b=DXmk7OxZ5NLsiFregsmPiqbi5f5nxlz3ndJ0XQJ6ZPEKjrs7MNSVGacaQxz7IgkYqZV08v4Geu8RXii17TKAbGWaQRVkO2XvNqmCtp2OMbYykJFyfv3LivDLgKBLYj7veG2q2RR1gsevv0xNTcQBTVV0iBZCLXeMuxXppfc5OSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781596102; c=relaxed/simple;
	bh=gIbC4mT4rnQeta6IicIaFvJ1Wxa93KPb8b+R1G56ToA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SwBGZNYnHKPQsd647yz1JBFLfMYo3nioDAEBNvLQtd3ByMAftYPWWpOx/nrstJDHo2Cxs+5AH+iniYTiVgL8p+Y7EigpHlRkvxjy7X+TS4xgMEs15LBqySN6pTGqyve6eBH/gLSyKhn/wx3Rr/NVKWCVO3afkBRR2jqK7mjvsLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXFb+3CE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91BAD1F000E9
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 07:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781596101;
	bh=av37NSExZHs3jYv7N/cbYxXhdk81GmmlLSodKahJSTI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=MXFb+3CE1mUm/r3/ht6RkLj7FdoVoyhQHS0UbSWitfKo0GykCBBNKLC1uaXfBgtzG
	 leo0TifVYnP1eNwKoDWT2aD8qkN//lEScIeom0GSvMDIqWL3CUIO6TIRmnnMJunxZN
	 mQpeThs2VLdCsl8CNrnxS+exlCF3AIhPNDxnmaSGgiC3wnkyfYKSbzlOIGjDL9noAm
	 Oy+Ba8Kibzo0xEFY8yS5z6WDfXFVC4a/XFXrTG/PTmZ9g2uyCa6baAgHgPPkL4Jtz+
	 C+tWi1FOd7+lo2d2o2kVquGHc0OqTilLRkexSCSB/P49zqv9rawBX03NsEjm0Lk4Z2
	 1uDtIGGG+VPJQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa68cd8dd3so3853186e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 00:48:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/xZZKJ4eQcks2vKj/VhjMbgtkwstQ0gTWNbsW3WP4xSBDHaRh+1RcQ52XgeudNbZCIjVSV/YZ2DRFZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyfCCVAyD5ZQhRqANcIOfxvSFf92QhrqUrZJAB33rZlEBS4dK2s
	OdoR72mEky35lN6sMeK0K3+Lt6CpTPuGUFQoTzz5ucNKwtNAltTIrPF3lZ96YWfnoe9GKOapWBK
	Opm1QVefqOF6ArwZr6AHchI7FMAD9YQxg2WpQsEH1XQ==
X-Received: by 2002:ac2:5392:0:b0:5ad:2acc:5789 with SMTP id
 2adb3069b0e04-5ad43316475mr591337e87.12.1781596100374; Tue, 16 Jun 2026
 00:48:20 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Jun 2026 00:48:19 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Jun 2026 00:48:19 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260616003941.82648-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616003941.82648-1-pengpeng@iscas.ac.cn>
Date: Tue, 16 Jun 2026 00:48:19 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeAWDtYPLXPDvD=cPNjKKJBSgneAEGb2UzvTJWCB5a6ZQ@mail.gmail.com>
X-Gm-Features: AVVi8CcdIm-y_dyUEVYiaijZkxF7bmVrL1ujcMQqVrkTzQB7BTWheWqfXGTTFuw
Message-ID: <CAMRc=MeAWDtYPLXPDvD=cPNjKKJBSgneAEGb2UzvTJWCB5a6ZQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: htc-egpio: use managed gpiochip registration
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38559-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,iscas.ac.cn:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2620F68CF6A

On Tue, 16 Jun 2026 02:39:40 +0200, Pengpeng Hou <pengpeng@iscas.ac.cn> said:
> egpio_probe() registers each configured gpiochip in a loop but ignores
> registration failures. If one registration fails, probe can continue with
> only part of the provider registered.
>
> Use devm_gpiochip_add_data() and propagate the error. The managed helper
> also removes any earlier chips automatically if probe later fails.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/gpio/gpio-htc-egpio.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-htc-egpio.c b/drivers/gpio/gpio-htc-egpio.c
> index d15423c718d0..1f7d7ac5603f 100644
> --- a/drivers/gpio/gpio-htc-egpio.c
> +++ b/drivers/gpio/gpio-htc-egpio.c
> @@ -268,6 +268,7 @@ static int __init egpio_probe(struct platform_device *pdev)
>  	struct gpio_chip  *chip;
>  	unsigned int      irq, irq_end;
>  	int               i;
> +	int               ret;
>
>  	/* Initialize ei data structure. */
>  	ei = devm_kzalloc(&pdev->dev, struct_size(ei, chip, pdata->num_chips), GFP_KERNEL);
> @@ -326,7 +327,9 @@ static int __init egpio_probe(struct platform_device *pdev)
>  		chip->base            = pdata->chip[i].gpio_base;
>  		chip->ngpio           = pdata->chip[i].num_gpios;
>
> -		gpiochip_add_data(chip, &ei->chip[i]);
> +		ret = devm_gpiochip_add_data(&pdev->dev, chip, &ei->chip[i]);
> +		if (ret)
> +			return ret;

Please use dev_err_probe() here.

Bart

>  	}
>
>  	/* Set initial pin values */
> --
> 2.50.1 (Apple Git-155)
>
>

