Return-Path: <linux-gpio+bounces-19319-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 566EFA9D074
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 20:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2B147ACC26
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 18:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51FBF21765B;
	Fri, 25 Apr 2025 18:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZStj5f/q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1240D188733
	for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2025 18:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745605470; cv=none; b=CGVKnCivHY2smUhU6+qvxgB0umHxrZqCaCStVUVb88iXB3uhRTkTnCAbI7Tm99f4jsbHkzCvCkju3mYbmODdY6lj2YIYUG4LdNSVSE22GKf1dXTU+x/peVjbOPICzivVE0jb/TltF1P6aui3IYh7OJM2BK3KU/und3jOorlX2No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745605470; c=relaxed/simple;
	bh=QJUasvZOB38Kj+cPi/L/NMvQuurePTK16tdmvgkGw40=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:Subject; b=Gqd/lKqFYUKFUzmQlZ6iqml4kCCrP7oIpgfQkfZ96VGDrFvKE9Z8iQuJdF9NAW1CckCwGf5pcBIibH/zxFwC86WhMnp1p1oZ+WDJDkRp85OPdsjP3/Gibpt8CKCQwfyrtAkeUYbFN3Zj8GNASw/ZpxqwxvMJ/hgTQW+fhlIERGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZStj5f/q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A999C4CEE4
	for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2025 18:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745605469;
	bh=QJUasvZOB38Kj+cPi/L/NMvQuurePTK16tdmvgkGw40=;
	h=From:Date:To:Subject:From;
	b=ZStj5f/qhqiVrlkDNuF7Rw8sxpIN63e2by+MOaTjOUAg+20wI+nlg0Vt+f5eX+Fc6
	 j4cGfcoAnG/oV8LrtDFIp7wsC5b+nd+CdpbItvdnYJt6wlGJJOmi0HsVOzI0lxMLcE
	 Yz0rFkhQDOpBV4PyJ1i2PxoZnREU4HoMysZJRkj8l81ucSV65JaAFAdVkenjmk0IT7
	 yp2XoRti4SeovVG/ezjT/qB6KdFGosMk36BMb2mtl02N1w4FueVvrIf0Ku7QG+qxEk
	 3dxB0aBrgrg9/1gIOk7P3AsMngjdyX1RMlK2hjdxuhBIyoNz/FM+ymjJeFLEq/4zzG
	 3sMeTYkxXT1lg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 380CC380CFD7
	for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2025 18:25:09 +0000 (UTC)
From: Guido Trentalancia via Bugspray Bot <bugbot@kernel.org>
Date: Fri, 25 Apr 2025 18:25:05 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
Subject: PixArt touchpad not detected due to wrong pinctrl
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Guido Trentalancia writes via Kernel.org Bugzilla:

The I2C PixArt touchpad (PIXA3848) found on some laptops using the Intel Alderlake chipset, including several Acer laptops and the Framework Laptop 13 is not detected due to a bug in the pinctrl module: to use the touchpad it is necessary to use CONFIGURE_PINCTRL_TIGERLAKE in the kernel configuration, even though the laptop uses the newer Alderlake chipset (CONFIGURE_PINCTRL_ALDERLAKE).

See: PixArt touchpad: https://linux-hardware.org/?id=ps/2:3848-3848-pixa3848-00-093a-touchpad

See: Framework laptop configuration on Gentoo wiki: https://wiki.gentoo.org/wiki/Framework_Laptop_13

View: https://bugzilla.kernel.org/show_bug.cgi?id=220056#c0
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


