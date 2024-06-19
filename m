Return-Path: <linux-gpio+bounces-7564-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C038A90EB25
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jun 2024 14:31:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67E171F24713
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jun 2024 12:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91CAE7F484;
	Wed, 19 Jun 2024 12:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yngvason.is header.i=@yngvason.is header.b="a0jG0Meg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0335B13B290
	for <linux-gpio@vger.kernel.org>; Wed, 19 Jun 2024 12:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718800315; cv=none; b=WP15m9lL/BD9jvBbSwEToKBWPe1f3EOXc6aiM6hIEE+u/hdVk2Lx+jMVprTc/49voAcDYoGTl6DB2hkC7L6IBKHufY62f6Z3Zbk8rz3SGU0poKqnzwFgqEjeb22Q+L8tTtS4XOfsRP+6v48o9I415bd8F0Q+wxaarN8yN5HT6Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718800315; c=relaxed/simple;
	bh=U0PcU3qCwgkEf/ycmHkzzhIWuTZZFxA5cTFeUmLgtWU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=uvUI9uRIXZ2c74OeXqcL/AGnuHR5EdIK9wWCYR89Hf6uuQzIcSynqhIqWVAVTGok2Pc9AJmIQPq84/elEwabz7h95Rpb/mPF6Wjf+zTlgWMRTiE/3ipPjMdxXk6/x3k5HZv5XVa6FSAxRbICOqwe1TAIlARCZWhtEE3kVPAmCOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=yngvason.is; spf=pass smtp.mailfrom=yngvason.is; dkim=pass (1024-bit key) header.d=yngvason.is header.i=@yngvason.is header.b=a0jG0Meg; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=yngvason.is
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yngvason.is
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-63258caaa91so49255037b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jun 2024 05:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yngvason.is; s=google; t=1718800312; x=1719405112; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U0PcU3qCwgkEf/ycmHkzzhIWuTZZFxA5cTFeUmLgtWU=;
        b=a0jG0Meg/3J0hpMQa3q1DMTRnuJO5I8Lm76aOgybkGgKxsFgmpV4OfVKvmacL2JkZQ
         VM75UiXRnVtDXi6Ib8wwZs5xMtCCMBuhqAKtzCSFpKzEnohf4jyg+j4snWwkIaTqgLZp
         m1EnoGxCCjWkVSeOU/InLJcpGRa9Wy4Ica+ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718800312; x=1719405112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U0PcU3qCwgkEf/ycmHkzzhIWuTZZFxA5cTFeUmLgtWU=;
        b=vc9kwLIR2HYdOtA2e++7rJBN9mixtbPhNPxeE6PFwW5ySZ7hIoOavmkDPAffUIklqR
         y/cSNIEx5xvl8axTSRiIpNsFkgrBtAuZdHKtzB/b4bEq/GEDrSV+JHn+ki0/WdUYXec8
         bqLN3vXXZGuvRNsejGP62B1gc75yRsiei2vsd8R0IqLMqspWlwAQU6mW25XWbc0qY89f
         ekFBW9fpcKZfeFg2UgmasWoGnTV/35kiRO7dx79Cp16fFZd/dvxgA7MkJVeoGTSE8QWg
         o/Y/plJ9IpI0s9r1nqptyUyQlty7j2bxdcZDkNd3sGZhKv/K8tz/VdU5TW7D65Cnnw89
         e9dg==
X-Forwarded-Encrypted: i=1; AJvYcCXYyt/l3QRu6XQWmnsVfUSrrceGvLJwOhejpzzrs5UAdxZ0VsMpBdEMK7qemdOBs8RfYbBehcUJBNqaQ3ZMhsBfNsHND0RxuhV+ZA==
X-Gm-Message-State: AOJu0YzmhtpPguL+to4b341G/SDomFlWoPNDiDGuIkah43qG3j30yZ//
	FLWJOFyB9K8FSeSAOeroF/Am5RRRAwTOc7dO14PSiQWp75HfO4WaVqaVsbEcfvRTccSenGDL4/i
	/tuJ/VJzNsR5eDDmkOb9h6FYTgWQbfKtvODVgRg==
X-Google-Smtp-Source: AGHT+IFGix6mQLKgzrkUVw8RNYlyzxQI6VbTV0zwmJhwHnDVr9NiNo7iny7WHWW+pODFlAxYmm9a9PrHsp6XqodJJGc=
X-Received: by 2002:a0d:ebc5:0:b0:630:3061:c22 with SMTP id
 00721157ae682-63a8dd044femr26139767b3.20.1718800311802; Wed, 19 Jun 2024
 05:31:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Andri Yngvason <andri@yngvason.is>
Date: Wed, 19 Jun 2024 12:31:16 +0000
Message-ID: <CAFNQBQzOZhOns6EfO9XJP3f=e0h8E=PBVxFxaC3QZsbBqiRh0A@mail.gmail.com>
Subject: Wrong GPIO mapping for Alder Lake U?
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm trying to use GPIO on an Alder Lake U processor with a ACPI device
id INTC1055.

Commit 0e793a4e283487378e9a5b7db37bc1781bc72fd7 added this device id
to drivers/pinctrl/intel/pinctrl-tigerlake.c and states that Alder
Lake P uses the same PCH. However, I am having a very hard time
matching pin names from the schematics that I was given with names in
the source file or with names from the dataheet for P-PCH 500.

Based on Intel's web page [1], I have been able to ascertain that
Alder Lake U has P-PCH 600, for which the pin names in the datasheet
do indeed match what I see on my schematics.

Is it correct to conclude that this is simply wrong as is?

Best regards,
Andri

[1]: https://edc.intel.com/content/www/us/en/design/ipla/software-development-platforms/client/platforms/alder-lake-desktop/12th-generation-intel-core-processors-datasheet-volume-1-of-2/

