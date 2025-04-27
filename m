Return-Path: <linux-gpio+bounces-19344-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 932E4A9E2D1
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 13:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C58F63B5457
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 11:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B10241665;
	Sun, 27 Apr 2025 11:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qsJh/5Nx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279AF1FBE8A
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 11:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745753968; cv=none; b=B2vQLE63+KNSjQ8a+eSZnf6vLAkoDtkpkrkecPQTX0fnV04eVpAMIKQCF/1axzlh3y7VvHrbjnOEz2u/T3oJGErXFKj0Z4C1S8I3kcklc6nT1Exxzwu/QYFjCTj2IgmJS6YdOj2tUDg1yhrvnhXCqcdHOQW9nbURvRgCCU/ulgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745753968; c=relaxed/simple;
	bh=ek5B5FN9h3MF5jbHUCSNj+hwGZMa/cdldit5xmzpH1o=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=rpGUND/lDR7tQjtsQkZuyUmCZYbVaJ1/40ztslFGQOe4yQrOT3d1TPgPxRYqn2+fqP2/JJOp2EMwFuYKtDnsBpBY+xfSOsrwPtDM6AYUG7kyHHnhA10yVMSqRuueA+buHMIqHRuddiBPRlNpuGQxkkEq5Q12WgBHaxFy13yOynM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qsJh/5Nx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB42C4CEE3
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 11:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745753967;
	bh=ek5B5FN9h3MF5jbHUCSNj+hwGZMa/cdldit5xmzpH1o=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=qsJh/5NxueWW89Kr2+WTRJCHZpOqJN7A6nkKw/v9oEtNBjmYQSSeOsflg3rQdGHxj
	 A/5ri5+bY7svrWE2nOtTuM46za0Cw+JLMwFGCxs0KXxiGD7oms2QWPE9F9bJofY+nr
	 tyGkHzlVI2f+zKyHFDjzrvDxrt1bL5kDUNSJdLYK8ea+Ep6K4jNv9CuL7u+Ddip15x
	 8aArQP95fyzxkMB2Gm773r+gj105X1yFeG4Uj53SX17tPZdem8hX1WtnvIFpGE7Cnq
	 R5p9CzAt4+iZSe103eHeYAY6vZ1JfCd1i8V/1iCaW2CQtK61MghuPs+/Rx9Miwoi03
	 ARjyGWh+sPqMw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 76138380664A
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 11:40:07 +0000 (UTC)
From: Ariel Simulevski via Bugspray Bot <bugbot@kernel.org>
Date: Sun, 27 Apr 2025 11:40:14 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250427-b220056c11-8bded10c65a6@bugzilla.kernel.org>
In-Reply-To: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
References: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
Subject: Re: PixArt touchpad not detected due to wrong pinctrl
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Ariel Simulevski writes via Kernel.org Bugzilla:

Thanks Andy for the clarification.

I'm still learning and don't fully understand all the platform details here yet, but I appreciate you explaining why patching the Alder Lake driver isn't the right approach.

Thanks again for taking the time to review this!

View: https://bugzilla.kernel.org/show_bug.cgi?id=220056#c11
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


