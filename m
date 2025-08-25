Return-Path: <linux-gpio+bounces-24947-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D40FB34AA1
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 20:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBD827A7960
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 18:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60174279DB6;
	Mon, 25 Aug 2025 18:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MHQ2MJE4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80849245021
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 18:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756147814; cv=none; b=sgZRXtbc1iL18YjIYxi5R71HS/QIbSQDLZHFPNud5mZP7mBxk9uToU8l1HQkgn/pCpo0aPoqIzy93mpudKyAiDZepLPdoKCgl3XIi73IiAIBQuHPn/cKc+7GfOKR7S3LX2dSJFAe40ng+btg+Abz4V8lfwsI8+gA/I4rPHd2TbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756147814; c=relaxed/simple;
	bh=ohKWsmb+LZ731g39Z3VfHDe8WpmeRLW7LmRh6xv29Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QGvxJ9dRWJmu6Tb4U3XKFJrexiBENUpaPOwNNudGB1BMRyF9yww5l65cXkCh2BZfCRtEhQqIF7ZK4sfXFQ/lR1nzR8ybtRT8Oq5Z3jv9Ki78DUm8FBDN8SgqkhsrUK8sav3R1WLQDgOnKZCE330TBtKiwQfHbzPyOU/YCVCA3+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MHQ2MJE4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45a20c51c40so37651255e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 11:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756147810; x=1756752610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEpDfvIqm/r9GFqYeso7+4c/opy1VTygOrM8Fx8oKUE=;
        b=MHQ2MJE4DNQD3X9x9ayYSCyn1qZnn28S8hPQv4EIFGJVVjr2WxYOovp4ESVghoHRlU
         e2LAV3Cg/LYVqM6A2OvxdbcOZSDdn4Sk+2mLo59PoP/TN6zhv8BmuOusQrkRG2Z/8ot9
         h6nstKoST+eGVmYprqyMuCdsuD7JzVVUDRdAf7PCdu9JZ5iHGZYabgAvBsSAGTJhY4v1
         MMSHlJ2RoHrH8I8fwZsI5Ryjgt59y/laa2NlC4zVRmCdRHqJYl8lb5H6aO2aharqSOG4
         +ahyyVRz0CNZIiRG01VoTylQTKzdPkvDUegNnc0AT3OwoRj2WRDwMjs15kZLfq2EUWq2
         GpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756147810; x=1756752610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QEpDfvIqm/r9GFqYeso7+4c/opy1VTygOrM8Fx8oKUE=;
        b=UGDXIbDngp1dBANzIEP5DeHOqTRKClVgMe7VBcX4PrxgfgMEAqVg7sO6ZS7LmQgbI/
         cnFWnlrcIknnW9VXGkW7v79ZXYLfEOde9rSkmDN1J4IKOszpuPG/XqmLmI6pWhvIqR+s
         NbKvyOdO5LZzs6eMWSy2XFlDqUJUW/4idQuUL4IGtLBU9Ba8FARiJAOw4GnT8MOLinQN
         M9tzSdCzuRhc3uZEn6+/mYcb/p7eB4YLB4Wh2ioYrFxmJ31umJTQmWIvd4Xy4XXNL2wm
         iMV2NWUC+AuyIwe3JAhXRMhF9RJ9rtFzXJjUyNm8BpZtBzTeIytdYyP8ef/6GB0IaADv
         NJ1A==
X-Forwarded-Encrypted: i=1; AJvYcCX00hGqAqhXTLXCKqPEeKYEhWf2J6ZCWL0HRC5rVREtJdT35txwS3MFSHbAIC2IO9NnnyrKWLaGNJEQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt9GnYlfqcMUc5eqUsvS1guXamOsjQ7s+wv3wpiA5EXXT+91fg
	CdtrK9VL16XzwSSPAuEJowgtxaqU+DTPDm+K6mir8EbW66tCJtutnD+rl1Ahg3NDvvM=
X-Gm-Gg: ASbGncsyJHuyDBBDqH7C/RRAGzuYFacSws8eVr7kJzWl2P4Df8YH6GXKXHbDtEiw0UB
	GMq9MiiICgP6HIIy+TRD7kkk4gRa+bG5xF9xlt8HlhilvsVHwoXHAOJMv6X02fQ1djVAM6upn3C
	3U32cFJBpsiV4d1a9RuM5WmkXBc8qOLJhNjiK1vTSLc6jin91ti9jNKUlyBA+pri5DcK/4uBhxf
	ECtMvs20k8fUo44qbukWtdPMaNi7Nc0BTbPW6T6HEvAD95BEBnvxnODoEtPdNxHiDuDlJYDPttK
	CAcmJ1IpPxjdoY/d6yZ6U6L3WWUQLjXU7bHsqVtbeNl9MQOt2gP0zh/I63n7rBYGoumKjRMiTlO
	Aid5vN8qTWoIZyt7TAXdWWLZAC108AwKI6NiT6kWuzfM=
X-Google-Smtp-Source: AGHT+IF/cd/3ldg9ZjLjZqDL50QxuBb1hA0sAhbeVdWvKKfysm+KbRVo87tAylxcuiKBSmMeLuiwBw==
X-Received: by 2002:a05:6000:210a:b0:3c7:2491:a2c with SMTP id ffacd0b85a97d-3c724910c10mr6332166f8f.14.1756147809705;
        Mon, 25 Aug 2025 11:50:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:490:f8af:73b:7a00])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5977sm12813311f8f.51.2025.08.25.11.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 11:50:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/3] gpio: mmio: Support IXP4xx expansion bus MMIO GPIO
Date: Mon, 25 Aug 2025 20:50:07 +0200
Message-ID: <175614780274.8817.4717113656972710108.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250822-ixp4xx-eb-mmio-gpio-v2-0-bd2edd4a9c74@linaro.org>
References: <20250822-ixp4xx-eb-mmio-gpio-v2-0-bd2edd4a9c74@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 22 Aug 2025 17:46:25 +0200, Linus Walleij wrote:
> After Florian reminded me to do things properly, here are
> fixups and additions to the MMIO GPIO bindings and a
> tie-in to the IXP4xx expansion bus memory controller.
> 
> 

Applied, thanks!

[1/3] dt-bindings: gpio-mmio: Support hogs
      https://git.kernel.org/brgl/linux/c/545908a9fb9c01e1bd7afe040f5623f561d50ea0
[2/3] dt-bindings: gpio-mmio: Add MMIO for IXP4xx expansion bus
      https://git.kernel.org/brgl/linux/c/1f3c076063f03999c351c0725adf744ef5660733
[3/3] gpio: mmio: Add compatible for the ixp4xx eb MMIO
      https://git.kernel.org/brgl/linux/c/38623d532c99ebd926f4eebb7c7de19cb7e5aef4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

