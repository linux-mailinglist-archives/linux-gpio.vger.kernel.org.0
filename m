Return-Path: <linux-gpio+bounces-36570-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CYyD6fOAWookAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36570-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 14:42:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA5B50E119
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 14:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 670493024FA2
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 12:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE3938E5ED;
	Mon, 11 May 2026 12:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnbuCsUm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E602637475C
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 12:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778502916; cv=none; b=nCVLOYttKi+BTJrfzhNvgNHUNB6Qq3R9vqsx437DTLSfNnmrtu2ble+BTFqqkygVma7F6DBETVkcUmEObKGayXLyi4UmMXfanGpucQlHY9Cc9yRvE2dMAYsU/NfVUrqFd/IwmoWzrx20M8IzsUV2kWNAhlMrDxmbXFGT9VsiRtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778502916; c=relaxed/simple;
	bh=fcb/Ov6tB1sVN2bjfPbORLqQbwuTXccakBXpztFcdfo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MdE8GhP7Dko5C4mAkAXaHeJzuPHi9FiPUGWqD+u4HkBk8EIiCySPFMDpQYDm5JEv72U48qL3MxidaWpuq0yaqUyyLG0Yh4SFZuugSs4hH98jZVK4uu56PUSnkU/ZMPoWFhEvdQogKMfgr2glRoZUf9MUQpk9wWh2G+B9Y45k9Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mnbuCsUm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A4EC2BCFA
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 12:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778502915;
	bh=fcb/Ov6tB1sVN2bjfPbORLqQbwuTXccakBXpztFcdfo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=mnbuCsUmlmoz8jm22RGB6DmM9roPxHGwA6bocqwdvhzIIhgvorEVi6uI5ueXebKJQ
	 /1BtE9kA56BTuqQwPziv0pl2lCt7WATFZ+VUKcrA1cmpGrHhPN6BJ8v+GMUJMHDkQC
	 JyRfmCIH3CJKBo6rQ3LpejqQ5ByFV4rQKAPb7WdgL5ncnlbKvVPeCX9fvYrOdYaHSE
	 6KAcsGJQTnueFvEz8WlnFfy9YuqENAieOSsjI7lvfwxkvSxlew+4DDcwqHrPsJlEZH
	 wB13+adxq5ofsMvbclI+4VykyH0h0EbVd3tI/TcLBApxJ+6+Hwop2YaUur7XYDUL8L
	 ASXZWxUDsNnAg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-393c40246afso43227141fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 05:35:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8PPbWjUvnJpuAcewgZFI99FwFndlJq5noyPUI75jLqZaEkm1iYl8+csv6p3vL0DR1fAa+LNjtihz7z@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9MvRffzeOtpTqS9dQgELF+b7aEdFImg6mq9I6VuSTFllGFlqt
	mbVHrbtD2oBh7ARmj64hivg1htx38i+u9LMlhLI1FQobNVxxU4TY5m7KHLQ+s1Q09cUE6pZS1F9
	oos7/aLxRHj1UNH7RAuvQdpqtWX3HIhtZm1IeF92jkA==
X-Received: by 2002:a2e:a011:0:b0:389:fa42:b266 with SMTP id
 38308e7fff4ca-393c40ff2c3mr53813901fa.11.1778502914301; Mon, 11 May 2026
 05:35:14 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 05:35:12 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 05:35:12 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260508143453.1886569-2-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508143453.1886569-1-ckeepax@opensource.cirrus.com> <20260508143453.1886569-2-ckeepax@opensource.cirrus.com>
Date: Mon, 11 May 2026 05:35:12 -0700
X-Gmail-Original-Message-ID: <CAMRc=Md7OB1h3SGwAKvES9x7_OJRfJ7b8mrbSOLg6CLih7kdQg@mail.gmail.com>
X-Gm-Features: AVHnY4K01hEfZw964IVhzdMC2MaffRP93XLyK9gvcHgWY88m2lPSVUJwoZPn2n0
Message-ID: <CAMRc=Md7OB1h3SGwAKvES9x7_OJRfJ7b8mrbSOLg6CLih7kdQg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: cs42l43: Fix polarity on debounce
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com, linusw@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: DAA5B50E119
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36570-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,cirrus.com:email,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, 8 May 2026 16:34:53 +0200, Charles Keepax
<ckeepax@opensource.cirrus.com> said:
> The debounce bit sets a bypass on the debounce rather than enabling it,
> as such the current polarity of the debounce is set incorrectly. Invert
> the polarity to correct this.
>
> Fixes: d5282a539297 ("pinctrl: cs42l43: Add support for the cs42l43")
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  drivers/pinctrl/cirrus/pinctrl-cs42l43.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
> index 3cc1835206077..305233fc19876 100644
> --- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
> +++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
> @@ -343,7 +343,7 @@ static int cs42l43_pin_set_db(struct cs42l43_pin *priv, unsigned int pin,
>
>  	return regmap_update_bits(priv->regmap, CS42L43_GPIO_CTRL2,
>  				  CS42L43_GPIO1_DEGLITCH_BYP_MASK << pin,
> -				  !!us << pin);
> +				  !us << pin);
>  }
>
>  static int cs42l43_pin_config_get(struct pinctrl_dev *pctldev,
> --
> 2.47.3
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

