Return-Path: <linux-gpio+bounces-26994-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FFDBCF563
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Oct 2025 14:37:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4420C4E44E9
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Oct 2025 12:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E2C27A107;
	Sat, 11 Oct 2025 12:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3jiQNDw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A637265609
	for <linux-gpio@vger.kernel.org>; Sat, 11 Oct 2025 12:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760186263; cv=none; b=pGTbBgAwNutxcL3PERRpyPNrGW3cvJmxs7GGYGi3MMq6WrhdYAQ3/dvviOTid/2WcZHkcUqGjQQlyUVWPLrcWTRA29LuU5ECYQZpiGxDT/VMTobZno4V0xd1BXF3GoRScetJ4ycqs6tFPI3k2nczc5/oV6qu6kJZcneYryNPMO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760186263; c=relaxed/simple;
	bh=FMiY4ZQUUOd4P9ieRmAGobDcQ34k1Ch4+rby9oBwooE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MrTTkhAUg2sXfjr4JvnEyWpbuSi0cyisXaRmLnmGOFtKaRIp9Py0HCw+LpjtwbImwTHFHYfAcoDYg2mG59t59Lv+cso59/rBCF0v4kbtzntq2AvqvZdDRvTKWkqWsgvRRt2I/M935uMtMYtJytfz8g/eQYCosmXDc6+XFT62fNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3jiQNDw; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3fa528f127fso2076048f8f.1
        for <linux-gpio@vger.kernel.org>; Sat, 11 Oct 2025 05:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760186256; x=1760791056; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5qg8csjW/Bsuq+K2XEr/yyiuErSXJ4xPd831KWzAqpw=;
        b=A3jiQNDwWo5H9XdzLicEMRo1kvIxX6jBGTXL7JOhpCOgdRamoFUbY11g9a4muKldQk
         Rs4fBKWNfaVo/SfO7IGbtJ4UvMeAr6V9t4vqETexDVofavQfi5RpKrtS7QN+gcyONKVk
         lFIWk1Js6N3Ym8lOzZEJrhinfJ/yslzO0/BsyGZlYV25bMEOJJ4mpjgoWXWM60VwnJfL
         qM53FeHaq6zZzfY4fQwY0B7ZoPYOEh0McvB79ogJEfVAiMY5KOno4+aMp410lKes0X/L
         gDjR0SEp0AvoiIEfuU17msMAkWwTnfxZXsyxBA3ArQYO6+FdrU008sRTakMJzGMzzA/t
         u4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760186256; x=1760791056;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5qg8csjW/Bsuq+K2XEr/yyiuErSXJ4xPd831KWzAqpw=;
        b=wj/XaTm3U8XoLkHmYv1AHaj/xv3pZcVGoNPrl4JXOWH4NmGx4ZH3oQOazpqLdy03kO
         os/vJYuFEhP69m4jfdP5SPxtKbh1g+/qSZDfxj9wwWShm3KwVDsskqffMWpUAzmTyQ+V
         YA8NO1p07dBMj15GKakCeEmP2VVFA2IrZZ0gVmXPLsGwYh7fDvKvx2OUVCaWe8M120No
         z7WtTVwHG/qOOW3/ACm9sRuwZw08dbj5wzACSXw5QVVTqajgLrmX3wBZIjxzfPyZSfqJ
         QGD2keUseGxGjp2tu1Dyu0uNNSBfWNYvy9bN4GabwmJXVD3wd18kObQGPWoqXQW2KwJQ
         saiw==
X-Forwarded-Encrypted: i=1; AJvYcCWAzy+Ujj4gaRIU/1ehb1afI0rZwZ8651o/zLErtcTTUN/ylqb6HqM9MIDJyjm7AVoAKipyI0s4HDOE@vger.kernel.org
X-Gm-Message-State: AOJu0YziHsykaQTZDIBXCp6kQHHo9ZdJnEsQaQJi6DkDF5V/U1H75on8
	SoHmZtA8LJIfxI/c/6rJQkMfzNFMrvPsxmDKMi5iakIpUnq03WZFRi6q
X-Gm-Gg: ASbGnctYsatSi60DlM93x/2EYT7oUdtUi2JEyr88BHK1V6WGRjqKIx0WFM8GKCuRCik
	Az5BxtKemTNdLGiq2MKxk9ZQNeTSc9061BIsCCHBqdRpvzlhYr4swwjpOSbQYIK7nch/yMmcUXn
	7FOrIR6K0fe18oJQQk1p0B/62BrnBGqRKsuv8NxZ4EqwYzuRDDeRElsbsVxrSM0n/EaE+I+Eene
	nRGQWQSRcZ8qj2Chb6dO+C67bG3BgDwnd+qY07XB+YjgSLUkuILrWEtMLAfD+wljepTrVF+FGHy
	jwXID8uRxA6HJMT7q3guFHxLaWSOGUIyJXF2DRCCmi5KZ1wuPkQ7QDgTDSh+Wl8IhkneJnYiQGj
	Zewm4nry8WF1fWbTdEw5bHE9STD2AUD0jUERF6MzzQXE=
X-Google-Smtp-Source: AGHT+IF+rcib9YhfwxDNHT2wDPbjArqhOMk8C1S9qvSwF+nEblZewag0fFJaLComFOM1/qCquehFqg==
X-Received: by 2002:a05:6000:288f:b0:425:58d0:483a with SMTP id ffacd0b85a97d-425829a5a12mr13673922f8f.3.1760186256441;
        Sat, 11 Oct 2025 05:37:36 -0700 (PDT)
Received: from gmail.com ([51.154.249.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e0a03sm8795159f8f.37.2025.10.11.05.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 05:37:36 -0700 (PDT)
Date: Sat, 11 Oct 2025 12:37:35 +0000
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Michael =?utf-8?B?QsO8c2No?= <mb@bues.ch>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Bjorn Helgaas <helgaas@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] driver: gpio-bt8xx: use generic PCI PM
Message-ID: <aOpPj86wEmtpIQQ_@gmail.com>
References: <20251010105338.664564-1-vaibhavgupta40@gmail.com>
 <202510110924.dUQeeRV6-lkp@intel.com>
 <20251011122612.4fa7c97a@barney>
 <aOpAO7j0Uyo6FPcu@gmail.com>
 <20251011143123.094043ed@barney>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251011143123.094043ed@barney>

On Sat, Oct 11, 2025 at 02:31:23PM +0200, Michael Büsch wrote:
> On Sat, 11 Oct 2025 11:32:11 +0000
> Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
> 
> > > It looks like the
> > > #ifdef CONFIG_PM
> > > must be removed from struct bt8xxgpio definition.
> > Ah yes, this macro somehow got overlooked by me. I will send a v2.
> > Thanks for the review!
> 
> 
> Also, the SIMPLE_DEV_PM_OPS macro seems to be deprecated in favour of DEFINE_SIMPLE_DEV_PM_OPS.
Okay I will have a look to it. Ingonre v2 in this case.
> 
> And please do a compile test when submitting v2. Thanks :)
Sure! I created another config file to disable CONFIG_PM just to make sure
during compile test.

Regards,
Vaibhav
> 
> -- 
> Michael Büsch
> https://bues.ch/



