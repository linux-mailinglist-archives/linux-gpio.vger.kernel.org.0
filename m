Return-Path: <linux-gpio+bounces-9651-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07961969FBA
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 16:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA85E28197D
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 14:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3033D2B9D4;
	Tue,  3 Sep 2024 14:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CtYWgIf0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860873612D
	for <linux-gpio@vger.kernel.org>; Tue,  3 Sep 2024 14:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725372189; cv=none; b=sabwMXWQOmxl3SH096hq8dtuHg1eiksIFymZSP6Au59Ink3XwWEqghcwu/Pn370H2APpGEcy87xxOa+bHZ+1n4/PhvNEL2qtbtP8mbxJrFkeyyFRXzviGuHtxS1K0NuRq4sSrKWV7Oknhoj5J/I0oKDST2ZgRn55VZ/busy+Uk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725372189; c=relaxed/simple;
	bh=KbVX5/WJLt/Z0+uhwnKhCH5C1tCBFTeakpeppFQXWBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZAPPEpjq58sW58C8bcX4Oa1o8BNB5V21kVzTSHZxM6UVl5METKM4Yt34LWeThCGeyrbmajONloarzfNgFEhy27FUtxyjo6/+OSQib19LITlkwecXdcaqwege3wpcg9DSjMHF758PgD8Nh/hxVaTMhJFQZ4xhmKUABaXkMOW7DtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CtYWgIf0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725372185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1T7shADQQm1E7ZhQRMDcUIIeoOERk2k982scWhmF05E=;
	b=CtYWgIf0RK8d2/a0BjxIEKayJkIXSIHaBGXo1/ygGGVDTp0H+FXGgZGI/7PDcrWCaCSZWq
	jzRPcA2rBRxg3PLeXm14r8sDOhQbrfci6A75XoLd3tJDHmFOmLj4SLd3EOZNXxxUJ+Dyvg
	iPEgnD+mUwMgzL+q+umOxu694ZC9zIA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-NNGUhds_Oy2YQne7Jj1HsQ-1; Tue, 03 Sep 2024 10:02:51 -0400
X-MC-Unique: NNGUhds_Oy2YQne7Jj1HsQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-374c960ee7aso1812002f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 03 Sep 2024 07:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725372165; x=1725976965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1T7shADQQm1E7ZhQRMDcUIIeoOERk2k982scWhmF05E=;
        b=Rz9WVef7+VHySQJYOJ7FKl7dmJHxr5ZKP23Od8YDiErqtqvThroru8CmO8JyGoeteT
         Y9wtlQlwA1esta4x0M+fp12MawWtgAQWQLCDLMTcaLPGNFHvfAKsEzhiApljnW3XIlwC
         EzNMDT20p0yDXPzFJc3Hv42nEmz5J/sYBvVQ5HlMSu4QD+76ZwRSnEtSrDv3ElIfWVNh
         Vv7pQz8fBvUDXkesM4NLK4K+0Pnxk2n03tgnqKuPQCGm0+bY09Kl75vEXAQ6qLZErf2t
         EdgCmKE5C9FOm6UnbwKVtQtlKMHAPDsqj4WaJiqBufDyNFpluQnUk4sYX2jWKvNPNiVG
         taSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9peUcDwMKHhC8U7FNsyboNA6CsQDjk482FpO1JT+1xVnK5FZ/w12nsJ2oEASx1a/neMuE+RLw4B8h@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+XTe06ssJt08AjwkFpXyk+DrzbEuM6kXr4GizOpijdJDH6NMV
	xDfGB3s1nf48YnaOPBlu9fwCAPwo3Trzo0DYVJ2PaK+Wu8t7SPAT3ezshZE3xw/Vz7iTgK7b7Oz
	zWMQzJhcA0hUap7c3NpfAM6Fk/TItYurgi4PAIPjLZ2YQGXr31o1bomw/OUA=
X-Received: by 2002:a5d:5c87:0:b0:374:c8eb:9b18 with SMTP id ffacd0b85a97d-374c8eb9b69mr5013559f8f.24.1725372164319;
        Tue, 03 Sep 2024 07:02:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG+gCA4emCQ8lN+v2r+4PD0Xf7gtP5260Hobybyq26ysa18Yk2eN574I3dEkpcvY9bhrHY7Q==
X-Received: by 2002:a5d:5c87:0:b0:374:c8eb:9b18 with SMTP id ffacd0b85a97d-374c8eb9b69mr5013434f8f.24.1725372163170;
        Tue, 03 Sep 2024 07:02:43 -0700 (PDT)
Received: from [192.168.88.27] (146-241-55-250.dyn.eolo.it. [146.241.55.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee9ba8esm14372770f8f.50.2024.09.03.07.02.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 07:02:42 -0700 (PDT)
Message-ID: <c5658b79-f0bc-4b34-b113-825f40a57677@redhat.com>
Date: Tue, 3 Sep 2024 16:02:39 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] ethernet: cavium: Replace deprecated PCI functions
To: Philipp Stanner <pstanner@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Wu Hao <hao.wu@intel.com>, Tom Rix <trix@redhat.com>,
 Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>,
 John Garry <john.g.garry@oracle.com>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org
References: <20240902062342.10446-2-pstanner@redhat.com>
 <20240902062342.10446-7-pstanner@redhat.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20240902062342.10446-7-pstanner@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/2/24 08:23, Philipp Stanner wrote:
> pcim_iomap_regions() and pcim_iomap_table() have been deprecated by
> the PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
> pcim_iomap_table(), pcim_iomap_regions_request_all()").
> 
> Furthermore, the driver contains an unneeded call to
> pcim_iounmap_regions() in its probe() function's error unwind path.
> 
> Replace the deprecated PCI functions with pcim_iomap_region().
> 
> Remove the unnecessary call to pcim_iounmap_regions().
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

Acked-by: Paolo Abeni <pabeni@redhat.com>


