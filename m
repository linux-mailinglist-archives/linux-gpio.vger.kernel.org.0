Return-Path: <linux-gpio+bounces-27264-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E92ABECDA8
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Oct 2025 12:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1B0E64E2754
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Oct 2025 10:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B33526F2B8;
	Sat, 18 Oct 2025 10:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b="Ln7Q9EUK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from cdmsr2.hinet.net (210-65-1-144.hinet-ip.hinet.net [210.65.1.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A3A286D53
	for <linux-gpio@vger.kernel.org>; Sat, 18 Oct 2025 10:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.65.1.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760784287; cv=none; b=gKgs2Edhlhpt24ngXYNoeEtjCUNnQzTE57fSdX4rQ+XtLgWEPnujxnyxM9qWa7bra1Lwe+SKr6ktnVPx8lcDy94MaKvx0njrGmKq6/dJdR19Gvp8eAWtwX4CEq2MPxBCYc4XZrP44gzfuuRN5Mr3k0hMwLLU6dr31+wvzGAmeAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760784287; c=relaxed/simple;
	bh=ziddJkAt80dhQ7vUMt1a1p8R01Kj9cZHBByeBMjkduM=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=AMlW4AeitZ2ehxLJLlGbpPMHdDIpiCxhONuxwETk+g3DB1ae1uunXNW3kWB954jw0RQYvtaUxBdP6BNB5ZNwRj2Nysdct25xduPbfDceFYciDf4JbtrEmfAxLvVombFEX6FecYjLXnSZlteD9K42cpxGG688wRGfQkWAPpWhWe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net; spf=pass smtp.mailfrom=ms29.hinet.net; dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b=Ln7Q9EUK; arc=none smtp.client-ip=210.65.1.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ms29.hinet.net
Received: from cmsr7.hinet.net ([10.199.216.86])
	by cdmsr2.hinet.net (8.15.2/8.15.2) with ESMTPS id 59IAigwg162721
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-gpio@vger.kernel.org>; Sat, 18 Oct 2025 18:44:43 +0800
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=ms29.hinet.net;
	s=default; t=1760784283; bh=taLTwVb9ntsIXyvgL8tACLdQZzQ=;
	h=From:To:Subject:Date;
	b=Ln7Q9EUKSgdwGuKlbViSHCEXG0qpPYVhDCW+PxtLCKK5DCwZ06rpix7T+T7iQ5gvA
	 qnvK+CuM2z3kXoC2EXX5zVfrSs9YZoVStHyMC57SRJsz0oyhl616YwCsWbEsbqCL4U
	 pjdZhjAzmEeJQmoKv8Lr7PQGaqpT6OSAI8Bgcj4g=
Received: from [127.0.0.1] (111-251-7-144.dynamic-ip.hinet.net [111.251.7.144])
	by cmsr7.hinet.net (8.15.2/8.15.2) with ESMTPS id 59IAbf8S315725
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-gpio@vger.kernel.org>; Sat, 18 Oct 2025 18:39:31 +0800
From: "Sales - iGTI 373" <Linux-gpio@ms29.hinet.net>
To: linux-gpio@vger.kernel.org
Reply-To: "Sales - iGTI." <sales@igti.space>
Subject: =?UTF-8?B?Rmlyc3QgT3JkZXIgQ29uZmlybWF0aW9uICYgTmV4dCBTdGVwcw==?=
Message-ID: <21829445-fc42-1980-e9ea-524747989c44@ms29.hinet.net>
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Oct 2025 10:39:30 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-HiNet-Brightmail: Spam
X-CMAE-Score: 100
X-CMAE-Analysis: v=2.4 cv=cYdxrWDM c=0 sm=1 tr=0 ts=68f36e64
	p=ggywIp0tIZrEgnU2bSAA:9 a=3VxGw7kNkDt6hAZW52zp2w==:117 a=IkcTkHD0fZMA:10
	a=5KLPUuaC_9wA:10

Hi Linux-gpio,

I hope this message finds you well.

We are a diversified general trading company with multiple business streams=
 and affiliated sister companies. While our operations span various sectors=
, we currently have a strong focus on the resale of general machandise and =
services on several products to our partners and associates in the UAE and =
UK.

Having reviewed your website and product offerings, we are pleased to move =
forward with our first order. To proceed, we would like to align on the =
following key details:

-Minimum Order Quantity (MOQ)
-Delivery timelines
-Payment terms
-Potential for a long-term partnership

To facilitate this discussion and finalize next steps, we will be sharing a=
 Zoom meeting invitation shortly.

We look forward to your confirmation and the opportunity to build a =
mutually beneficial relationship.

Best regards,
Leo Viera
Purchasing Director
sales@igti.space
iGeneral Trading Co Ltd
igt.ae - igti.space

