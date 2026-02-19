Return-Path: <linux-gpio+bounces-31859-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CB+2LHDqlmkzrAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31859-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 11:48:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1715815DF66
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 11:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B65C301C17E
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 10:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA482EA481;
	Thu, 19 Feb 2026 10:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jpnrhssc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DA926D4F9
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 10:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771498086; cv=none; b=gbqy7Qtmo4zH2nWcQPph6ENPbHuYouhQldJ2vBNNKYGrO8a1/zGoB8UiMu8bXYDpG740uT8B2wVqcv1Qc7cN+AxIKhJeJuhmiNkBPmGTV+OIlzw076exfwY8K/dFi9k7e95TqNzRCwLvskULb5O318sc6N7QmE5FeEs2EAnOEiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771498086; c=relaxed/simple;
	bh=5bC70PL41UqDnf1lVCma+t7FL8Ugq/KOX1/e8Qv8l30=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KuTZ+QgfYsDURAB8tPOxAyTOEbJm+11qjRFiA8XYdVtKkaOw15UQQfRdBb/Rt3eEOYT25BZ0GOVDj6arDfevomYosluY9L8gk35V+SHaNouxPeolhDfUvsFFthcme3zpOnfOp4epUsCgq19T2BwBKWHNjks26kynVYyXu9KtP1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jpnrhssc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834EBC2BCB0
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 10:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771498086;
	bh=5bC70PL41UqDnf1lVCma+t7FL8Ugq/KOX1/e8Qv8l30=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=JpnrhsscziusaxROrTqrShMJOrLI6Lr/4Q2A7ghB9hE089fSfuLKIcdX35wBIM4j+
	 fQPiMdatNdmUxew0n64Y4DpaUwxikznUuJ3noWfgUMEiABIo330TyxQhI8xgFqcBmx
	 W5BEqS7u6RaCGBPCD2enFwkyeV9AhWCPeVxNvL0lbdhEpaUGO6I4TFmrV+JbfkTBSM
	 0s3h0HSYlp536f5AVjWCxKp2WD6YYDo4/GzXNkLqoNHuBPaP2H4pdUNf2OweTGJsso
	 lz8X1RDEb39Y6w5NlmjHoLX7XgvBXEBkWmf1cT5GtfxRidDplhp4KN1VncK1M3jvsd
	 HFMUHF8ckdJLw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59e6253b16bso908643e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 02:48:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVfYlb8bByCounOIGDnx6C6/KR070gl0fLQhcTJTvW6cmStIbGwde7hD6tjsR/pLCZFCerC1RnZf2fR@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlyje3MndM3ii7FUvIByl4Poi/cMOWGgNxHkgEZ6/w6A+NMnKn
	b9Wnm4jKIFYX4/paRd+sH/IX9kj3nIkDJeok7Ynz744ExSn9uVjOGJotDQlfcByd9i5pbVF0zcK
	NYlu7XGh7xn0bZB8cJMPEyWn75bTudr7Odbrst/c9sw==
X-Received: by 2002:a05:6512:238a:b0:59e:538c:cd9f with SMTP id
 2adb3069b0e04-59f0282a181mr7002305e87.42.1771498084893; Thu, 19 Feb 2026
 02:48:04 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 05:48:03 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 05:48:03 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aZYnWZqfzKwzzF4f@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aZYnWZqfzKwzzF4f@google.com>
Date: Thu, 19 Feb 2026 05:48:03 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfwP6u3dS+WNEp0LNWF6mZKJenxHus2qo0cH6BgPNAx0Q@mail.gmail.com>
X-Gm-Features: AaiRm52NcFlTJ7qHZTJuhQEJKWXctP2flJ0GgElalxql3ZMD8B1_-kRsIUFL2jU
Message-ID: <CAMRc=MfwP6u3dS+WNEp0LNWF6mZKJenxHus2qo0cH6BgPNAx0Q@mail.gmail.com>
Subject: Re: [PATCH] net: phy: qcom: qca807x: normalize return value of gpio_get
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, netdev@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31859-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org,lunn.ch];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1715815DF66
X-Rspamd-Action: no action

On Wed, 18 Feb 2026 21:57:17 +0100, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> The GPIO get callback is expected to return 0 or 1 (or a negative error
> code). Ensure that the value returned by qca807x_gpio_get() is
> normalized to the [0, 1] range.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>
> [First copy went to Andrew privately by mistake]
>
>  drivers/net/phy/qcom/qca807x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
> index d8f1ce5a7128..6004da5741af 100644
> --- a/drivers/net/phy/qcom/qca807x.c
> +++ b/drivers/net/phy/qcom/qca807x.c
> @@ -375,7 +375,7 @@ static int qca807x_gpio_get(struct gpio_chip *gc, unsigned int offset)
>  	reg = QCA807X_MMD7_LED_FORCE_CTRL(offset);
>  	val = phy_read_mmd(priv->phy, MDIO_MMD_AN, reg);
>
> -	return FIELD_GET(QCA807X_GPIO_FORCE_MODE_MASK, val);
> +	return !!FIELD_GET(QCA807X_GPIO_FORCE_MODE_MASK, val);
>  }
>
>  static int qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
> --
> 2.53.0.335.g19a08e0c02-goog
>
>
> --
> Dmitry
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

