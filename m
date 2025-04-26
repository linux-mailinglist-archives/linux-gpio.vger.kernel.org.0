Return-Path: <linux-gpio+bounces-19333-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0D9A9DD59
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Apr 2025 23:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABC0D1898186
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Apr 2025 21:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328F51E9B06;
	Sat, 26 Apr 2025 21:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qc9mnZLB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBB4139E
	for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2025 21:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745704170; cv=none; b=PIpoJw3bb1vfszgBPe6FAIgTZLABDDRk30/Zycbd7Osrs/Akb1GIDk9XgGIKTJPLEqwGK3yANRHhqgX5cy9kXU+0Mokg1aLooPSJo0F3thUars/L3Yx8ifdKG6lYNr4JBezBAP2AbP7C8EK41jaHohGn24B1ktGzDHDqtiCE/DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745704170; c=relaxed/simple;
	bh=Cs7Ht68X3fyw/DrDRLsDO87m2kB9GYqmY8AERYNUM4g=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=IG9wCyAw1xlgpLMYQ8655ekqScshG6oq/YsL7mjB//n5Sc8n/UH7QJ4Z1MaluPL0rpoBdD90SptH+TtWzrzCWs3LRLiYEIxYMqOZy0rst30Dl9VOWvTVjlfZXrOUtb/Xmqdfj+n2sKTbyzvIAdTIVViulVzGYiRzMFsUzrGxqg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qc9mnZLB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D097C4CEE2
	for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2025 21:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745704170;
	bh=Cs7Ht68X3fyw/DrDRLsDO87m2kB9GYqmY8AERYNUM4g=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=qc9mnZLBsD2A5V/v9MyEkuoh0Fq9SkUdVZCHwhQ3QwKb0AeEaqVwZvuGAVObBn7pa
	 EnJS5dnEjuGxu7lOgktdt0vbdSRd0REw0AENDUJRdWI5brQFZYGVCnS6Y7Cl6VUMdG
	 tVLF0gDkYcmrMY0fXUbQ06G3UkF8bMn4JKOy5irQR+dsj3ujSPmqhyWUJij4jYSakb
	 6xN5uoxOJnmlTi3ucrIN+KjUCwTX5NckH9iv6nGGdsHhLndqJj+5E0w5gF9BJ7bILW
	 cILIq/az0k8L3YOuuYvoK3r5aIxYuiU/Pfk1pApxDMx0AI0GFTfLTWlw1mhCq5BOCH
	 2njN9KaDymhXA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F0B38111CC
	for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2025 21:50:10 +0000 (UTC)
From: Guido Trentalancia via Bugspray Bot <bugbot@kernel.org>
Date: Sat, 26 Apr 2025 21:50:08 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250426-b220056c4-c85f466abc2a@bugzilla.kernel.org>
In-Reply-To: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
References: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
Subject: Re: PixArt touchpad not detected due to wrong pinctrl
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Guido Trentalancia writes via Kernel.org Bugzilla:

Please see the attached revised patch: the comment has been improved and the new pins are introduced with at least an acceptable numbering, if you want to avoid reordering the whole list.

View: https://bugzilla.kernel.org/show_bug.cgi?id=220056#c4
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


