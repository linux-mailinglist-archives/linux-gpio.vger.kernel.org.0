Return-Path: <linux-gpio+bounces-33157-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGknIWWAsWmjCwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33157-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:47:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 25763265A76
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:47:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2E4630ADBA7
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00EC73C7E11;
	Wed, 11 Mar 2026 14:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iykfec35"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77FB31ED7C
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 14:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240216; cv=none; b=Ls//ZyMgdDvuba/Yv1EKrtfL6MbPf2jp+lZVnA82XYYBuozFzXvv4d0/VETgI+Y+HBikIMNTCW423qY1cboTNzGuOY09ntkjlBS9OoeRDInGjwY30YjVRu5KyfZZTzEZGYMuKxK61EErebDHO7t8LyRxWdRLPH+nlJSTZyUwQ60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240216; c=relaxed/simple;
	bh=z2Opfsu7wWQoB6oIqeEPNMOgLj/zQSEAX5dXMT69Bl4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J7X734DAy0nPA/GID566crvNTCRayklis6odtoEwu0HB+IvsI+50lghja5wQbq2YVDbksGMpFbCrmIxyw+Xsd1fmvX7Zt4oIcUgTRp8fygFBopPVLfWAX3D2XqkDIw/vGJ6jBaGOxKgHfOt5j2xlGmGfG7Oyw0BrXIBmzGtP4H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iykfec35; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8262AC2BCB0
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 14:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773240216;
	bh=z2Opfsu7wWQoB6oIqeEPNMOgLj/zQSEAX5dXMT69Bl4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=Iykfec35ykDpcL5Mch2kvdMBSrPV+3+cWdMasCfrWszH/ogZWVDJdQ4qdK+3zlEvy
	 voL20VEK1gs22+no6GE3rejRV9fmuAHoBD53hvKjSaPcvbCCYfHfK0arO2AGGZwfzX
	 YJYgMNZAGms8d1aZD9jcAl+N17aFPFawyjsFnEc8AggJzIOnptT7lfwCaFvSpBKKpT
	 3Ic7dfkR3y1bMYUez/IJ6HAyLFOLPZnM9qV1eec2CLcwkaWnj+odGeNERHIuEToGv6
	 s+lneJeKVu7SK3PeXcSwyGhovSWknSIxCWH8awPyr0utnZ1nbaIIVi1by/BicXl2dP
	 q+lManUIoQJrw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38a40273544so42990581fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 07:43:36 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw9sOczX0TzMqhEj2NjF++RT2L8hTYaMrZsJiCLHPrzdi2b/uXc
	Z8UUeHdqc0CY6eLvOlpucB7df1c9v5gGcTZCqoG8U7hBKDsXcBaFzNkZ+C/icGqXYED8IYOaVFw
	+mTGQu7kp6KbHRaER26VTgHWB0Dg0wHDgFLZovUbUnw==
X-Received: by 2002:a2e:bcce:0:b0:38a:50c9:baa4 with SMTP id
 38308e7fff4ca-38a67e3b31dmr10333341fa.29.1773240215164; Wed, 11 Mar 2026
 07:43:35 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 07:43:33 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 07:43:33 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260311131910.835513-4-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311131910.835513-1-antti.laakso@linux.intel.com> <20260311131910.835513-4-antti.laakso@linux.intel.com>
Date: Wed, 11 Mar 2026 07:43:33 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mc3f6GeOKVwz15sNvVMkKSM6uU99Wpbx7DcWti3xqJabA@mail.gmail.com>
X-Gm-Features: AaiRm50K9d9aYvSFkl5IG6NQFz2c8vnIOQpkBs_H3PPzfZCghftrBpfEuEWxE4g
Message-ID: <CAMRc=Mc3f6GeOKVwz15sNvVMkKSM6uU99Wpbx7DcWti3xqJabA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] platform: int3472: Add gpio software node
To: Antti Laakso <antti.laakso@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linusw@kernel.org, brgl@kernel.org, sakari.ailus@linux.intel.com, 
	mchehab@kernel.org, dan.scally@ideasonboard.com, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, hverkuil+cisco@kernel.org, sre@kernel.org, 
	hao.yao@intel.com, jimmy.su@intel.com, miguel.vadillo@intel.com, 
	kees@kernel.org, ribalda@chromium.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33157-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 25763265A76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 11 Mar 2026 14:19:08 +0100, Antti Laakso
<antti.laakso@linux.intel.com> said:
> The tps68470 supports i2c daisy chain, which need to be configured by
> gpio-tps68470 driver. Add daisy chain information to software node.
>
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  drivers/platform/x86/intel/int3472/tps68470.c | 1 +
>  drivers/platform/x86/intel/int3472/tps68470.h | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
> index a496075c0d2a..a77ed32abe55 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -197,6 +197,7 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
>  		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
>  		cells[2].name = "tps68470-gpio";
> +		cells[2].swnode = board_data->tps68470_gpio_swnode;
>
>  		for (i = 0; i < board_data->n_gpiod_lookups; i++)
>  			gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/platform/x86/intel/int3472/tps68470.h
> index 35915e701593..3bbaade96c57 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.h
> +++ b/drivers/platform/x86/intel/int3472/tps68470.h
> @@ -17,6 +17,7 @@ struct tps68470_regulator_platform_data;
>  struct int3472_tps68470_board_data {
>  	const char *dev_name;
>  	const struct tps68470_regulator_platform_data *tps68470_regulator_pdata;
> +	const struct software_node *tps68470_gpio_swnode;
>  	unsigned int n_gpiod_lookups;
>  	struct gpiod_lookup_table *tps68470_gpio_lookup_tables[];
>  };
> --
> 2.53.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

