Return-Path: <linux-gpio+bounces-28202-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 174F6C3BEC3
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 16:00:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C14A9563A79
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 14:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF522EB860;
	Thu,  6 Nov 2025 14:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ns8d0hi3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBCD3446A6
	for <linux-gpio@vger.kernel.org>; Thu,  6 Nov 2025 14:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762440934; cv=none; b=Et5lHbxSDkSfWd14g+KBMxNTHLtV+1Szgu5CTLLMr14am+k7AfgJ7IcMDOQdhtQDLuMIy/gzgjI83wPcVIzbyNpgdBV4zzfkg5xWpQY0wu3nP6TrK7JNGcC4pSDgc8pBhcRgFm5TFhIRwLJs9uCsRj7NyHNDGShFDz35ZUUZ76o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762440934; c=relaxed/simple;
	bh=pYE5ok0vlSgpBexEoHOeJzvor0Q/N4IOwbE5Ew+Vg2s=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=EMPt/V0GmbAuJtAHWBOtG96cvy4f4IIDsafP8hDOgkFAzubNNXNmej/u+zizPIDCLd37QrnXvmRdzm7yszPghZYcBiBcbm9lDgJzP69zwziyp1LUR8zQ7eIgE3i2lqho5FnIZ8AgKQR4tCtSmvJeHZHcbm6MSsdh/e6L68YsBco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ns8d0hi3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCFFC4CEFB
	for <linux-gpio@vger.kernel.org>; Thu,  6 Nov 2025 14:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762440934;
	bh=pYE5ok0vlSgpBexEoHOeJzvor0Q/N4IOwbE5Ew+Vg2s=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=Ns8d0hi3kxx2HjTuBXqu8aJkqf8oxvkqs0cVVclwy43dqW/+NtGYebDpCFxdXyDM4
	 a23oery1YL6Tuhg4hGPlyg5gxwBDrG7LM13U78bhnI0Ia0eI8mJKLn45eNwuCqCB2m
	 tUfhElEzV2+VpGHM6beAfsKeS/We17H85AknN7Uzm2iG4sdMSdiS9fh9Vj0B5paSn3
	 cVWjKkyXojkfi8ZQ27DpQ+4HGwNTRJBdJJZ7AQyIOnLnSgM34XY1i8qNIfCFtEQzBH
	 ZuMYuEmwqY136w3Mh95Zw6Q3yCLTXFjmzjZgwaNawpttCzjn6q2LXAq98UfXS4r5iq
	 moKbXjcZ7dCyg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3851839EF945
	for <linux-gpio@vger.kernel.org>; Thu,  6 Nov 2025 14:55:08 +0000 (UTC)
From: "Mario Limonciello (AMD) via Bugspray Bot" <bugbot@kernel.org>
Date: Thu, 06 Nov 2025 14:55:07 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20251106-b220733c3-e3cd9c05459f@bugzilla.kernel.org>
In-Reply-To: <20251102-b220733c0-57e8f5019609@bugzilla.kernel.org>
References: <20251102-b220733c0-57e8f5019609@bugzilla.kernel.org>
Subject: Re: amd_gpio AMDI0030:00: failed to lookup the [default,sleep]
 state
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Mario Limonciello (AMD) writes via Kernel.org Bugzilla:

You can clearly see this is a debug level message.

https://github.com/torvalds/linux/blob/dc77806cf3b4788d328fddf245e86c5b529f31a2/drivers/pinctrl/core.c#L2176

View: https://bugzilla.kernel.org/show_bug.cgi?id=220733#c3
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


