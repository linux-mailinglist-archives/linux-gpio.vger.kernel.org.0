Return-Path: <linux-gpio+bounces-8248-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3326933F50
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2024 17:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42F9AB209F4
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2024 15:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78A9181330;
	Wed, 17 Jul 2024 15:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXGq+mwI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D26C20B0F
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jul 2024 15:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721229101; cv=none; b=ZhFeK2Yml3/MQCiRLfBM/uVxEYhmi3IhfunH4pFyFXjHp0cPGxoFwC7KCWJVYPf9euzL+V3+7C1NeJ03CoYU6M7aJ4tXRK1azcQrtiDl0RxLFXN7rhOSeexRPx5/IKIumQeEcRA6UzGgJn7GLO2Z6cOZpwvJiAXD71fz6x8KXtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721229101; c=relaxed/simple;
	bh=lz0Y1xQm1lt1JjyvTfjAvj43GiTkTjMIkSXUbq1eBDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7R9d8xwBQopDXL0rcp9PU9Mh/w5Aw3JAXd5jLcqjsQmTn7cESIwOVweuzt8pi/r7PGzkEEi2HcytGgf28N30LsM/62pIR1lYVIe4qVjltDeMqay83WQcfPSo7HV8pTL74i/7FoUwITYmxquAR5bfIFU8n7Tkv9edKrgDSK3/+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXGq+mwI; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2cb585375f6so352777a91.3
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jul 2024 08:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721229099; x=1721833899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cqN60Jf1ycfDdus/f0Obg9odZC9LZV3OF47IofiTOv0=;
        b=EXGq+mwIvAXf5pW63/plkmi5jH8fwQYsWlwmeEYuj3peJ06VI76I5ZgvqKv9CW6nJF
         nVFe/Lzv/0x+TZzcI+3/i47StxG9qQX0dMyJm9K8nbS1EMWxQ3ICwX7PBKcsniIrhrTS
         cJSVnsimE651G//gH7PR2pGqL/xcI9QurOCg3O6W5l2YBV+gSJ+mNTCos4yTIxqA6KyZ
         DVOMJ09y2ALbQiAYyBLPz/eP3bhkPd92I11mJpO1xV3dUCyhgekxPVlPvb2wOHNSR4Is
         YzSp1j25nuQsoEOErI4/RogewGOTSGmTuJu9RG+798VZ0a+xldPESvaAcrn778LSJrC2
         nWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721229099; x=1721833899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqN60Jf1ycfDdus/f0Obg9odZC9LZV3OF47IofiTOv0=;
        b=TtBKz9HEns4PYy+G6WQ6Y2p4OeKizAU5Ev1kUS8CB1xhaesiYQKAax61CqC6oEGdl4
         AOpIJ68SvhQDCBMHUVkUtOdCKsYglIHmjylYa0yLrR5aFIsesy9qGM3IqmV1n3shaenr
         UC1lOzvi2auuimB9YgZMCjTdkTZyR4aMBVNp/mzBS5UEViP/admMFNGWLlTCenBJ8ujZ
         LfGqNXGejaCQ6E5w7w0WX6VCzc+DxVFkB+uCQKZtIHXjenjaQThtOdd0LZL0hSX6c7h/
         47E+kVdRZGdcXkODSjZ7ytFyXd2v5+xKLfzcYgKbjmWcRhrieLg695GR0USkBHFCP1SX
         Gmfw==
X-Forwarded-Encrypted: i=1; AJvYcCUYzPKYSolgfuSgMybIgvvM6eQAOTM/r+uxnIFYHWCuFcMMmHNJ4UgOwpBFQ3Lo6iUnyuVrFv/ulYJv3fSyItIK6t2C4rOn0GByzg==
X-Gm-Message-State: AOJu0YxrF4YlCQO5sFZEImfxmAl7V49lzHqALkb7aoqey5d9M0lajLoR
	LVuqaKJAyqnTMvA3fUHi3ecRF2VxPTzKEyY6Ab8haYFi3mqYoBk/
X-Google-Smtp-Source: AGHT+IHqRLoLouWBhVkKdxOB56nNQ8s0Ry9trNYZ8pkTA9hAq0wUdD9aZrJkmeydk2bDekhUbUIDRw==
X-Received: by 2002:a17:90a:7c07:b0:2c9:6ccc:2fbb with SMTP id 98e67ed59e1d1-2cb527a5d5bmr1577629a91.24.1721229099466;
        Wed, 17 Jul 2024 08:11:39 -0700 (PDT)
Received: from rigel ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb60117e47sm47237a91.23.2024.07.17.08.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 08:11:39 -0700 (PDT)
Date: Wed, 17 Jul 2024 23:11:33 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: brgl@bgdev.pl, ipedrosa@redhat.com, javierm@redhat.com,
	perobins@redhat.com, linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH 2/4] lib: line-info strings termination
Message-ID: <20240717151133.GA119430@rigel>
References: <cover.1721039339.git.ikerpedrosam@gmail.com>
 <d86be0c6c536429f515be080ea43cc7180396476.1721039339.git.ikerpedrosam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d86be0c6c536429f515be080ea43cc7180396476.1721039339.git.ikerpedrosam@gmail.com>

On Wed, Jul 17, 2024 at 01:36:42PM +0200, Iker Pedrosa wrote:
> strncpy() truncates the destination buffer if it isn't large enough to
> hold the copy. Thus, let's terminate the strings with a NULL character
> at the end.
>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>  lib/line-info.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/lib/line-info.c b/lib/line-info.c
> index 9f53b04..2ded9ea 100644
> --- a/lib/line-info.c
> +++ b/lib/line-info.c
> @@ -148,10 +148,12 @@ gpiod_line_info_from_uapi(struct gpio_v2_line_info *uapi_info)
>  	memset(info, 0, sizeof(*info));
>
>  	info->offset = uapi_info->offset;
> -	strncpy(info->name, uapi_info->name, GPIO_MAX_NAME_SIZE);
> +	strncpy(info->name, uapi_info->name, GPIO_MAX_NAME_SIZE - 1);
> +	info->name[GPIO_MAX_NAME_SIZE - 1] = '\0';
>

Given that uapi_info->name is not NULL terminated, this change can
incorrectly discard one character.  The correct solution is to increase
the size of info->name to allow for the NULL terminator, which would
automatically be initialised by the memset.

>  	info->used = !!(uapi_info->flags & GPIO_V2_LINE_FLAG_USED);
> -	strncpy(info->consumer, uapi_info->consumer, GPIO_MAX_NAME_SIZE);
> +	strncpy(info->consumer, uapi_info->consumer, GPIO_MAX_NAME_SIZE - 1);
> +	info->consumer[GPIO_MAX_NAME_SIZE - 1] = '\0';
>

Same here.

And same in patch 3.

Patches 1 and 4 look ok to me.

Cheers,
Kent.

>  	if (uapi_info->flags & GPIO_V2_LINE_FLAG_OUTPUT)
>  		info->direction = GPIOD_LINE_DIRECTION_OUTPUT;
> --
> 2.45.2
>

