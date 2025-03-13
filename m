Return-Path: <linux-gpio+bounces-17517-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA0DA5EBB3
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 07:22:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74D62189A0B7
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 06:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184541FAC38;
	Thu, 13 Mar 2025 06:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="PYfhGe2x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546A22F2E
	for <linux-gpio@vger.kernel.org>; Thu, 13 Mar 2025 06:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741846923; cv=none; b=ZbmYyudh6Lu+so7keFanuEuhb+InHy7frHQYNnhEZU+A49hnJr3gtdz2YwFLpU7C1cbBXbhkMcEKermrO+SFDjcR8v3tuCamzzEBzbg1yo7Sj/GTW4LVfqnZ9yZAICV4QT0oasnk+b5Zw7+Q+24zvjPHRNXea8RdYYzpM0m+qDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741846923; c=relaxed/simple;
	bh=Bkke58CZs+O7cPdDuzvaFsn3jWVtju1pz8je5gQeFX8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=imX+Q6Wkarv0ZLNkLw5nJVaLnJ0P4mRxHCmo9GgZsCbcmLSNPHtPpx6DYMVQrCp1Xzz7ogWoj9u629DxWuU/Si3PZv6omuFkxPdqDMWy0Q23M64bOWEwXk8AS0ELuGGIkxb+GbtqppDiTeYOiWM6QAFE9bp0SFxwmQvrqDCkeRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=PYfhGe2x; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1741846912;
	bh=Bkke58CZs+O7cPdDuzvaFsn3jWVtju1pz8je5gQeFX8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PYfhGe2x2Fo+iFDqQ4g6Drlot3uW/mAoeMeq/7AeqxjsFBVTqHh7xW0AcAfPV+qNt
	 tcD22GbeWZ614uAZ7w+i5KVGc670UYV/5u0G9ylT6hvjGWhUrCj2JJcAd2MlfCmcE3
	 TBSAKcf42Ae7OaDMMFlAsVAsNOcj3XJageqWHnXYfcuoBTKBtWt9R5P7q9br8otg1d
	 o56Oem5BWepJSzlgkMG2LcY3tNpxXWBwuTq/avpwPa/mmGZKpGUgZz0LmPipJlYKyI
	 BGYv4eEQA/NAy6uvRnzBMpZTNCsZsALk7vgCArmaCJapgpLHAK7updL8eMP+wFI8o+
	 SSyfmSm5qTgxg==
Received: from [192.168.68.112] (unknown [180.150.112.30])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F3BD978812;
	Thu, 13 Mar 2025 14:21:50 +0800 (AWST)
Message-ID: <4878ed9cfd9ff20550cf0d9d8933ec993f4b288c.camel@codeconstruct.com.au>
Subject: Re: Question about ASPEED GPIO value/direction set order
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Nikita Shubin <nikita.shubin@maquefel.me>, Joel Stanley <joel@jms.id.au>
Cc: linux-gpio@vger.kernel.org
Date: Thu, 13 Mar 2025 16:51:49 +1030
In-Reply-To: <3cd0fe0ff42a751fd0738dacf16badcaa8ff51fb.camel@maquefel.me>
References: <3cd0fe0ff42a751fd0738dacf16badcaa8ff51fb.camel@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Nikita,

On Tue, 2025-03-11 at 15:40 +0300, Nikita Shubin wrote:
> Hi Joel and Andrew !
>=20
> I am observing "strange" behaviour when pin direction is set AFTER
> the
> value itself:
>=20
> ```
> aspeed_gpio_dir_out:
>=20
> __aspeed_gpio_set(gc, offset, val);
> gpio->config->llops->reg_bit_set(gpio, offset, reg_dir, 1);
> ```
>=20
> Is this as intended ?

Yes; you tend to set the value only when using the GPIO for output, and
by setting the value before setting the direction, we avoid the
potential value glitch which occurs under the opposite order.

Andrew


