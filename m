Return-Path: <linux-gpio+bounces-7225-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F9A8FE15A
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 10:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5343FB23545
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 08:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0576613AA5E;
	Thu,  6 Jun 2024 08:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ecSNAF4E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3351013C819
	for <linux-gpio@vger.kernel.org>; Thu,  6 Jun 2024 08:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717663485; cv=none; b=m352c9q5Aqhv+wNNTJfWMbcKK+t6Qkj6a+SvUq7f8xKdhNT2O0gFNX1EC9Qunhs6K3NeWL6aaNBCtBwYRIAzOeoOVf89TgzipyoFLtaCieYauqy7z1Zicm+5ke6I2NbVEZjGx+6LNI0ppGh6B1U088QoiY4xLRhVFIPL9TMhXho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717663485; c=relaxed/simple;
	bh=4X0Vmi7mTAJYWGrjKKzI6h4qBKZQebI8iaPHk2YjP+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hK+zxQXpDrcW6qJdjMpAAo0u8XkYeV/DZLDCDEtAHc7464j7bnoSSpTyKDwsL5OZ89tx+e1X2leHFpDbIDR6sPEbeE1OsYJk62mWLPIaPPI5AwpBR06MGiu5/1l4eNT26Bk/lO3XuctlveWpSs8fTDUAL0rNW0p1KLSriHKiKb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ecSNAF4E; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a68b41ef3f6so61103366b.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Jun 2024 01:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717663482; x=1718268282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nCenLKKmaeyPCyjxC9wqKNVE1ptH2j73X14vfWp2iMM=;
        b=ecSNAF4EHJuSO6Q97OOZ3lqqxRByVZJilER6rRXrbrLJLXe55KDpeGirFje15ttTQg
         rq2IcFkAtohIKgfGDss7ucqKBz937da67Ydl//FDGAhIqwpZ6DCuHVALegjAoF17Sz5d
         3LzJ+2HCr19p5mJzywKNNnhADuo1vLB9BPsffAIkbM4+XW5qY7qZdIw5XmLRSrNK6G/L
         JY0k52yefiWtQsU545VqHxdtf5ahWb/D+nC0t7q4QotRiNBMlA9O3xN5Q44L1m8+wImF
         b7HSjEriq1ceeVdnTGuHqBAMH7pTFsaYvD1v5FJf6P64+DR91mvHc5J11Fkebl8eXuAB
         Z9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717663482; x=1718268282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCenLKKmaeyPCyjxC9wqKNVE1ptH2j73X14vfWp2iMM=;
        b=cv+SP/OWynD5SFoD4XtCG2wvphwZrxfI0PNB1y82RAwSjfgYeEumFcP/MLJkiV2/3a
         OMWuG3aIdvQTqzEl2AS0tLGtsRVyEul7GhwYwCMtn9i2Lr1E+BN+BdF27QLJ0ecLAmYU
         H4QJwjXlmgDlPC/InWWnzhd6R17XVfZKNVx/6UbH/UAcumhMXxhLsg9EvoRRPVmrT8DV
         TFLU7vJ2DRwTYkpMwgfTs0mRaN43KhFhaQSNjMrp//U6njVO4dYWZ1rPLtiU8vwbqDuF
         Mk9Ttgy2JIwxWmtfGUsLv7HFM1YhTEVlXPvHx1BJuS00PbzfgbgvySvUhwsLNV/WZgUl
         SWMQ==
X-Gm-Message-State: AOJu0YzMp7vdKau6xYveQNoHZdq0PNsS8orLKQU1HqiNc6JToesGRQzJ
	CO8LyPOA2mj0OQmXux69DSNrUoMhbbieTD/T01v4ERCC+/+9ORiLTIIEN1HA9CE=
X-Google-Smtp-Source: AGHT+IFGoskTIrePCHqmFfqH92N33EYZ3TmpOBLFpbyqKm5Uw3MHVE4APeE05ymFxLXJaPOpEn8YNg==
X-Received: by 2002:a17:907:7da1:b0:a68:ae2f:ea42 with SMTP id a640c23a62f3a-a6c82feb4f1mr57521866b.65.1717663482384;
        Thu, 06 Jun 2024 01:44:42 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c805cd97csm64825666b.67.2024.06.06.01.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 01:44:42 -0700 (PDT)
Date: Thu, 6 Jun 2024 11:44:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, tony@atomide.com,
	haojian.zhuang@linaro.org, liwei391@huawei.com
Subject: Re: [PATCH v2 0/3] pinctrl: fix possible memory leak when
 pinctrl_enable() fails
Message-ID: <f2aae368-3fe8-4cc6-b288-b1cd749901ee@moroto.mountain>
References: <20240606023704.3931561-1-yangyingliang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606023704.3931561-1-yangyingliang@huawei.com>

On Thu, Jun 06, 2024 at 10:37:01AM +0800, Yang Yingliang wrote:
> In devm_pinctrl_register(), if pinctrl_enable() fails in pinctrl_register(),
> the "pctldev" has not been added to dev resources, so devm_pinctrl_dev_release()
> can not be called, it leads memory leak.
> 
> And some driver calls pinctrl_register_and_init() which is not devm_ managed,
> it also leads memory leak if pinctrl_enable() fails.
> 
> To fix this, introduce pinctrl_uninit_controller(), call it in the error path to
> free memory and replace pinctrl_register_and_init with devm_pinctrl_register_and_init.
> 
> v1 -> v2:
>   Check pinctrl_enable() return value in pcs_probe() in patch #2
> 
> Yang Yingliang (3):
>   pinctrl: core: fix possible memory leak when pinctrl_enable() fails
>   pinctrl: single: fix possible memory leak when pinctrl_enable() fails
>   pinctrl: ti: ti-iodelay: fix possible memory leak when
>     pinctrl_enable() fails

Thanks so much!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


