Return-Path: <linux-gpio+bounces-6589-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C45A28CD214
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2024 14:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECA0B2834DF
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2024 12:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 382FE149E11;
	Thu, 23 May 2024 12:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcv7+yeQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3015149E08;
	Thu, 23 May 2024 12:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716466494; cv=none; b=qc21HUyMRuoPXHMPnYz04/K6rByA1ztbBVzUC56qbyXT/gMuGFy1qKhJf5X3h4qM1pBRKDfWmgM5hQ72Cko0noX1jSxWQzZ4mSHu1lyQVCP4sjJbRStvy3paRPZv0GJlTZUsUs+PH4fBeEXtw+q4C4dM0uZGvU4X3LIRQPmWt/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716466494; c=relaxed/simple;
	bh=tpZ43iLgwhzMpQ4jhyu4aR5C7L7JyFApng9aEdXunQY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f5fO1WAWABg52vxALWgovcL1QubUl54MhYnuXR+2IcDvWO+n6AdeAhBMRVZU+mGgvuMhO2H8tofKhwaHEXfRe50Mimhoj2aMgZFrMrcMY8O/nSVn87DKKNvKfLNooOAnPCbYfSPflHOWR1L+zDy5YWiDdFI4wW+FKDy/VBPqEQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcv7+yeQ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f333c7e702so11439505ad.3;
        Thu, 23 May 2024 05:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716466492; x=1717071292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJJ+dpO9JAqVVNhYRIjTougt3/8fCcumUWusy1MIytw=;
        b=jcv7+yeQG9ohfnOFQY0W30zMMt9y7+Awlla21TYdhz9M7X5e2KIppdoqD9OrFiqXQB
         tVM74y5GCK5Bv4fA/e5QLwJYqkTH4iDgLh8cJWDCcHwxIIKhUJEL4Uj5X5+Au24B949z
         NZ41JDatpwE6w9TDzEA9tEYXkLbT3Usd+3gUrzAEj53Vkby3LWhTlpcdndqAGyD1ZDKd
         eGLXBbZRiqTTVUyQdO8GbgiM9Vkz6oEbcBpi2gcDSAZKWNnXwkUcr+5xZXKqysvidaua
         rC54Ux8NdOESM8xKOg6VGRAuVy+zm9vIgZfWTS9+JbwMvqRZhQbmR0U49ZY1UkiYBsei
         j5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716466492; x=1717071292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJJ+dpO9JAqVVNhYRIjTougt3/8fCcumUWusy1MIytw=;
        b=ouLU62b86iSMCwAHI/ZaeIkbyX1YIeSDjaNVdR+hmDd90tptNwYChvBmGHcG7zpSph
         47LPuyriEgrObwcSRm4/KR6j0atcaSEffDBQAhni5oCgbMR2L/6bakzizVpfL9E+dmGL
         N6Bcb02MPOog7xOAOgPDcYEpIuoCxM4y4zfXLU41xeZ6sW8imp5spUQYkcOuMJtuS8yx
         6J837VuPrEG+tr3xe6Qkp/pwe7x96DxZ0uY/uEjHRnJK4zIMz9pNb20Vk1p4sAQuDpLi
         hBWELqjIxMpuapb3OFe/jycmL57nR8VAGSqv6MsfnIVuakXJXVE4v37ozVM8IGU8V8nV
         E+Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWuE8ZvfSdE6quI/5V/ChzIkDfDnDUa3Brqw/XlcMU/nhu9aLkxar+wUWgs3AAhqQkR1sbcPIr/Hf+4nLpB54mB4BSE3x1TKhiHX5Qs
X-Gm-Message-State: AOJu0YwpvTGKMQ/3WANqd2XEDhqV331mlzxMDTVdn959irHxTmApNG+p
	3FaJhUXBZzWD5G1w8nn6XBXFr6OiqY7XmkeP8ZPdzoQt2GIR0vvo
X-Google-Smtp-Source: AGHT+IE1Xq5OpvbEcrljAxvBnUvk7aDfToPhNYoqTE15ABCo2eIf6WTn6UKgdRdPtAlFwqQ0O3i9Cg==
X-Received: by 2002:a17:902:f610:b0:1f3:3265:2fb0 with SMTP id d9443c01a7336-1f33265329bmr38163605ad.22.1716466492068;
        Thu, 23 May 2024 05:14:52 -0700 (PDT)
Received: from VM-147-239-centos.localdomain ([14.116.239.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f33569120esm16554975ad.284.2024.05.23.05.14.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2024 05:14:51 -0700 (PDT)
From: Yongzhi Liu <hyperlyzcs@gmail.com>
To: kumaravel.thiagarajan@microchip.com,
	vaibhaavram.tl@microchip.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jitxie@tencent.com,
	huntazhang@tencent.com,
	Yongzhi Liu <hyperlyzcs@gmail.com>
Subject: [PATCH 0/2] Bugfix in the error handling of gp_aux_bus_probe()
Date: Thu, 23 May 2024 20:14:32 +0800
Message-Id: <20240523121434.21855-2-hyperlyzcs@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20240523121434.21855-1-hyperlyzcs@gmail.com>
References: <20240523121434.21855-1-hyperlyzcs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The error handling of gp_aux_bus_probe() invloves issues
related to double free and memory leak.

Yongzhi Liu (2):
  misc: microchip: pci1xxxx: fix double free in the error handling of
    gp_aux_bus_probe()
  misc: microchip: pci1xxxx: Fix a memory leak in the error handling of
    gp_aux_bus_probe()

 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.36.1


