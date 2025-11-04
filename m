Return-Path: <linux-gpio+bounces-28043-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C95C32B2A
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 19:45:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96F0518998EA
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 18:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BA831BCAA;
	Tue,  4 Nov 2025 18:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CqF7Pirt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845FC7E792
	for <linux-gpio@vger.kernel.org>; Tue,  4 Nov 2025 18:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762281936; cv=none; b=Zr6CqgJ8IUyPhzYZrRKzZNsB5NdJ6PCW9WXiI+TAZXMJcFbUjmSTUw0qMIltsuzx/ANdmPIiNhqfA3NyvLnFlF2rVUyrzK9NhmB8k9ZdVJ8iLfIf603R5HSUdfFUO7cs+TxGHorSHeLLlq8g+gpHBVe8ntwvRdJCs4DJUG1hFPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762281936; c=relaxed/simple;
	bh=a9UojVxGMQOBMzdDmoqu3+UBYcnzBUo4BdIl1rqybVQ=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=Ulk2X4pFQdAE1HeKnntX5TA1w4rIQqp9Af2/FXiqPi1+nNmKgbPD+8sCtmKFv9hYvoSZz6h4CSPYYTDPrEQXVvrgbDshBQoN9GLf8b5osAgGFD0jfItsbWJNZRW4DTzsLzVbh2SegVtdsjf51YLI8CSnfQko38suT1CS68TWcRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CqF7Pirt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E83BC4CEF7
	for <linux-gpio@vger.kernel.org>; Tue,  4 Nov 2025 18:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762281936;
	bh=a9UojVxGMQOBMzdDmoqu3+UBYcnzBUo4BdIl1rqybVQ=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=CqF7PirthXCvQIX5x6HOpyhzaEObWFDezDDw4YDaInprSd2Ac8THlIzpnIRAQFFFq
	 JUvMFYxDbMkbGUOMrt7nQWxkSSkxwJo2q49dz0puynrauwTE0Y6OUKbrphIHEXsgWQ
	 GyHjdyIOVBoyMIgpgWsDwr5iry1O1+1T+dMdhRsqzYHmnGD8IwjY8t1QN2eVJdzjPw
	 wsyHjtdHFZOPAH/1reVA3c/N8cmSMeopVmzOjgKPD340BIympWPwPbPkoNAyEdxPeh
	 1H62nITGrTLj/DiuNSnti5PThtMlTVpNPzZnrHuOODuhZC1YZVa8eP0Jvf9VHNsbMP
	 GSXzbmwp9Nm6Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E6F380AA44
	for <linux-gpio@vger.kernel.org>; Tue,  4 Nov 2025 18:45:11 +0000 (UTC)
From: "Mario Limonciello (AMD) via Bugspray Bot" <bugbot@kernel.org>
Date: Tue, 04 Nov 2025 18:45:09 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20251104-b220734c1-911a959e073c@bugzilla.kernel.org>
In-Reply-To: <20251102-b220734c0-8824a4f6fe88@bugzilla.kernel.org>
References: <20251102-b220734c0-8824a4f6fe88@bugzilla.kernel.org>
Subject: Re: amd_gpio AMDI0030:00: iomux not supported
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Mario Limonciello (AMD) writes via Kernel.org Bugzilla:

Like https://bugzilla.kernel.org/show_bug.cgi?id=220733

Those are dynamic debug messages, look expected to me.  You must have debug enabled while loading in some way.

What's the problem?

View: https://bugzilla.kernel.org/show_bug.cgi?id=220734#c1
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


