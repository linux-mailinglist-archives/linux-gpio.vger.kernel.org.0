Return-Path: <linux-gpio+bounces-19335-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BE6A9DD95
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 00:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54AD4174C55
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Apr 2025 22:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100181FBE8A;
	Sat, 26 Apr 2025 22:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dS4z4LPH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C3D1E9B06
	for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2025 22:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745707168; cv=none; b=T9AFDXB48LPfpyZv//k6Ln8yLYizymVjAGh1QMa+e7fttpdLiJ/WxpdOqRW/STAtLXNPtPGJYVglDBTT7F1xr+1UL6lG4bSqBz/lPDsO85Q7uL0KWFDup4RQ9ay519oY2xTFSTromYHa4ati84mhPWtNickqWDOgAyBZlyHEJpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745707168; c=relaxed/simple;
	bh=VSiPmZqFZkhCfw9o68RgU+UHK+moB/iqBaaILjyU0ao=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=YQ1HV88uOeSMqSvVeAJZczeuXF/qn8PsXWMD+5ulZDHwjQmkNnkLfY43vHXt8XxYoNCbMepWq3bED+GovzMVUjykK1IfYEvjom6WhDh3tahQ9xYtTT+KOFWuqdI85equ0kjumTglzPjEfMmUtW30cDCyMC3iRD1oI3DvA6X5+Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dS4z4LPH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D8A0C4CEE2
	for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2025 22:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745707168;
	bh=VSiPmZqFZkhCfw9o68RgU+UHK+moB/iqBaaILjyU0ao=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=dS4z4LPH1p9nslQHBflV2EnWR697a2+svt5cvztrF/INbB5nv8wdJHKBf+Ydkr776
	 5zERFFKHsxvIrCiBpneVe+C3UiHHorny2t2d00DcFLzWIOBal849YosyvK6VSlzIlA
	 +4KgqHotE6YvQHe8QVz7pqPfgYr0LmUkCVqo8Js+G9WPpumVCH5IF9k26WIQl5uwxp
	 sCwv1mw1ThVp7Bnap6UZc9bdNxjzoFgBPu2QmRrbyL4Lj5SliEvuIRU+IPphwQIThH
	 +SHMLeWKWCkUi1C7EKZJvFOCt9YDGzkSusVSU9WUifCsdjhMHrHF0L7sC8UUsj0hwA
	 ec/OsHqLfENIg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F024838111CC
	for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2025 22:40:07 +0000 (UTC)
From: Guido Trentalancia via Bugspray Bot <bugbot@kernel.org>
Date: Sat, 26 Apr 2025 22:40:09 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250426-b220056c6-8dd098869e70@bugzilla.kernel.org>
In-Reply-To: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
References: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
Subject: Re: PixArt touchpad not detected due to wrong pinctrl
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Guido Trentalancia added an attachment on Kernel.org Bugzilla:

Created attachment 308026
Second revision of the patch with an example on how to correct the structure bounds

Correct the community structure bounds.

File: linux-add-missing-I2C-pin-defs-left-over-from-tigerlake-v2.patch (text/plain)
Size: 2.42 KiB
Link: https://bugzilla.kernel.org/attachment.cgi?id=308026
---
Second revision of the patch with an example on how to correct the structure bounds

You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


