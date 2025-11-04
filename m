Return-Path: <linux-gpio+bounces-28042-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C667C32B27
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 19:45:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06BA31899665
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 18:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1972652A4;
	Tue,  4 Nov 2025 18:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCDE3NyB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AC77E792
	for <linux-gpio@vger.kernel.org>; Tue,  4 Nov 2025 18:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762281933; cv=none; b=Bi7b7yJ3zu3F6sn0y72T8e6zigv8MgTwB2auNmCNR2EBNObYtmbgoovA/atkK+J92pRWCuIcQZ0mZgKwv9wVmUEw/atPnKmrzSapTAN6LfauaxAFzuki+rfJnlk3xN5Km5XCQuJ56ZA+FBn7nwWmfCoplOh3tl66wopMSLAQGjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762281933; c=relaxed/simple;
	bh=w0asCLN72r/P9+wr8iXwE6TOaQ3YqZSSkHXd68hdIzs=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=gKAux+/DjdK0zSaWI8g5mz26PmVqrUBtGqSNm2CmuZaK71JCM3NKNuWymlnyWWywQ+LKb/xLEP5aDSsfOhn8/Miw+mR+9IYNgUdGW25IEGGzVRGTnyv+eYYJv3v4IdkvDpM6e08p42onsaIiwZYyBJypWWDck8Hp2i/gfOZcPaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCDE3NyB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB8EC4CEF7
	for <linux-gpio@vger.kernel.org>; Tue,  4 Nov 2025 18:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762281932;
	bh=w0asCLN72r/P9+wr8iXwE6TOaQ3YqZSSkHXd68hdIzs=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=FCDE3NyBRERHZMUu+1DrLVylU2pVVU/sWzvXqIPPQ4rR/ZEaAwp+J4uC7/CytX6AS
	 Kfb5pM3YgcSeo1oFtgqEh97GallcI6/bfKhMdQoijGdA0qTMa1lY29x4ylSeX8ZDyQ
	 CEdTucm282GcwnoHPlppSV2Uq7d9bCyFzcCvRW+t+fW8+/ktWyg0hc903SRAdn80Ep
	 flM78JtOkFjNck1yuyPq2xVMHw0jbY/PdA2K+ULf5uHQsQMpQUMTlDhBHRH72s+EJ7
	 vOqEzgwSw5CbmtNR5+LVhqC5YCjXVCfmaZK5i8ay6V19R/tK+NhymMW943OFWjJ6BL
	 CmGzqU8t8evow==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 38453380AA44
	for <linux-gpio@vger.kernel.org>; Tue,  4 Nov 2025 18:45:07 +0000 (UTC)
From: "Mario Limonciello (AMD) via Bugspray Bot" <bugbot@kernel.org>
Date: Tue, 04 Nov 2025 18:45:04 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20251104-b220733c1-d2f66c0aef6c@bugzilla.kernel.org>
In-Reply-To: <20251102-b220733c0-57e8f5019609@bugzilla.kernel.org>
References: <20251102-b220733c0-57e8f5019609@bugzilla.kernel.org>
Subject: Re: amd_gpio AMDI0030:00: failed to lookup the [default,sleep]
 state
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Mario Limonciello (AMD) writes via Kernel.org Bugzilla:

Those are dynamic debug messages, look expected to me.  You must have debug enabled while loading in some way.

What's the problem?

View: https://bugzilla.kernel.org/show_bug.cgi?id=220733#c1
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


