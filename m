Return-Path: <linux-gpio+bounces-37040-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPHTGEbZCmrb8gQAu9opvQ
	(envelope-from <linux-gpio+bounces-37040-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 11:17:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDFC569875
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 11:17:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 945F7305ECEF
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA783E3DAA;
	Mon, 18 May 2026 09:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IYL8VN2S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D253E4C6B
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 09:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095451; cv=none; b=IDu17wU/n7I5YJKn9cWoX+UEzvtc259O21FcOazx518wiCmeemKlcb7TalBTiRF6SG2rfLS4fjdmsbGuG29LmcGzUvSaHoq/Ho0LdTDNbBUQepeBuXflZ4ZeWTuZzP2Rigf/tlMZlYCRTNz/pioP6FmhB+HSkfNhKg/HqgDkyOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095451; c=relaxed/simple;
	bh=4yT5EZN656SF2/gngje7SHiaxQJejlgBvUV/6lWTxWY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jR6oALdlezUEkPV97X1PwPCRypX5u6Pmmmy1FuyfMxuP0v99pMDbbBSG3PIeK5mmAOBkG8PXBJKho1TsbsFL3wKldlbJxNmmI+mlVrQDoGcBb8a8yNB3qKPSUs0VBSWHMT8fIczL2WG88cbewlSb/aTqouhLmiXgd/8YNzPcbog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYL8VN2S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 013C4C2BCC6
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 09:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779095451;
	bh=4yT5EZN656SF2/gngje7SHiaxQJejlgBvUV/6lWTxWY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=IYL8VN2SlhoEq+R4Xm1vmkheerpFsUOAR6Kt6ORsUFyaD6j7rQjzyMaNxzypGEhSu
	 HfjThg9CSUoofrPqvkWB5QSjgVDQUCqyoKj5w5Z3QWsMts6o+Aorhw+V57yooaOAMc
	 uvTa7dOJdaZi/SMIRJzIKBgw8IwNANK8BE+bZqrLRStq7Ui+VbqBAFBQVg4SEdF/sq
	 0X3yqe0ByXFoLWc1AtrRsIhO3h9kmjw4W3WxkbBLyZjwIKWERSwrbQ8/qMBMTzpJz/
	 Ga9rr4muANXKjdOw3yEIgJh5z65mQvat5pFxpw/UFQ2iQENNr3HMC89kzB2MqLcqMo
	 w+Y1dF6+7XyRg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a8d1f43432so3550699e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 02:10:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/fX+YgOnhSodPFYR/aVvjqG/j+qHIIN1w44v/SN8dTMUtRtJRFcWs/F+Nc7sWe49pWpvBDNTPa46O3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3P5zUUI77Vh8u4woij8N1e3EELkDOEvZvLIanv5TlbwgQd9Vr
	uOVbZGscVoFE7WEwx8MsEGSz405iqwbeiF1Jc5YMxCAB6XznkAXZGBcNQEIccYUhT1+7+8XdBl+
	oBkVoMjCu4EJ0YpEg2HdRRzndsZbxmqV4V+x9lLXg1w==
X-Received: by 2002:a05:6512:3b84:b0:5a8:64c4:38cd with SMTP id
 2adb3069b0e04-5aa0e73c7demr4152960e87.21.1779095449709; Mon, 18 May 2026
 02:10:49 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 May 2026 02:10:47 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 May 2026 02:10:47 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260515124008.2947838-3-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515124008.2947838-1-claudiu.beznea@kernel.org> <20260515124008.2947838-3-claudiu.beznea@kernel.org>
Date: Mon, 18 May 2026 02:10:47 -0700
X-Gmail-Original-Message-ID: <CAMRc=McmEB-QiH0E2L6pKH6hpjs5TebBwD8Q0+UGX9y6gRRDRw@mail.gmail.com>
X-Gm-Features: AVHnY4KErhf_NUM0SHKxTHxG6bi6FJwz8ioPaQ4HfLLiIr4BiwwiMep3RXJG8qc
Message-ID: <CAMRc=McmEB-QiH0E2L6pKH6hpjs5TebBwD8Q0+UGX9y6gRRDRw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: renesas: rzg2l: Populate struct gpio_chip::set_config
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, geert+renesas@glider.be, 
	linusw@kernel.org, brgl@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	biju.das.jz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: BBDFC569875
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37040-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, 15 May 2026 14:40:08 +0200, Claudiu Beznea
<claudiu.beznea@kernel.org> said:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Populate struct gpio_chip::set_config to allow various GPIO settings.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - used gpiochip_generic_config()
>
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index 05a33655e6cc..ac42093fc579 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -3212,6 +3212,7 @@ static int rzg2l_gpio_register(struct rzg2l_pinctrl *pctrl)
>  	chip->direction_output = rzg2l_gpio_direction_output;
>  	chip->get = rzg2l_gpio_get;
>  	chip->set = rzg2l_gpio_set;
> +	chip->set_config = gpiochip_generic_config;
>  	chip->label = name;
>  	chip->parent = pctrl->dev;
>  	chip->owner = THIS_MODULE;
> --
> 2.43.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

