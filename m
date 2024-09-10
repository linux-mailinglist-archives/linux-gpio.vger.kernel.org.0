Return-Path: <linux-gpio+bounces-9938-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBB49744FA
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2024 23:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D7F12878CE
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2024 21:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB981ABEC2;
	Tue, 10 Sep 2024 21:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n4IKv36H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804C11AB521
	for <linux-gpio@vger.kernel.org>; Tue, 10 Sep 2024 21:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726004707; cv=none; b=JLkYpsxfROVSEpag46ZjdFD4XmjymZEbBaxYG4BZwPWipQAHKUD3cZEP27VjgYG03ug00PLjZG1j+JXysN+VEQoYIkl2pX/9qe8j6gNpoopYyuZ6IvCi42HiRYA2QDUqcRcKGkeeteJdqwDdJXIqIJ1BghxXDnjLzkgmQEyD7Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726004707; c=relaxed/simple;
	bh=/1zCNq1ZY1NFAkulbaWPrIAFFlX8Add2UGTgwDX7ZI8=;
	h=Date:MIME-Version:Content-Type:From:To:Message-ID:Subject; b=I+PdlwmpFQwDkqgd7SydlBvkn9nE4Whsq2uyFAt/3grp+wl7zrXirwXT4HZSg/RwtMpjvQwQ0QvEHmB5ur3JnWAHaCRe1GSOGbDc7WjpTQwVy2YxBupkECiLXxZUx8gtLsrAUJJEsja+s9aEkQDZXqlqV/u2zeG1VSl5BfUMZw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n4IKv36H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF12C4CEC3
	for <linux-gpio@vger.kernel.org>; Tue, 10 Sep 2024 21:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726004707;
	bh=/1zCNq1ZY1NFAkulbaWPrIAFFlX8Add2UGTgwDX7ZI8=;
	h=Date:From:To:Subject:From;
	b=n4IKv36HayLtf2g4wLI7EDHAtTurec4SOiFwhsV6HYsxYTtsGkTMxYoREoX/whuX/
	 XDKrj6oLi3ce2zjHNkra8Ln6oReWRd/pgtyyjy9AbCaTfrgOlnZUziz1ZfqQAnPtvD
	 cgAZf1RSwPoPzZtLT9xpXsKuev5NbdHnV+WOePcU0cqX2oLTXdD/TnXDj/46/m5/1q
	 kHmuw2xopsIPzUbYeBIEo29wx1koNupTKzGPPgv/ZIJfvJxgnKNhIzFKKeunzoPwx0
	 MLOCh8v38QDahHEVBwyfiu9uwrMG13hsGDH+ZoKDbs2cFSMSwKOX9a8WmOHgnJcfL2
	 QomNRKvlv4Rtg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 385533822FA4
	for <linux-gpio@vger.kernel.org>; Tue, 10 Sep 2024 21:45:09 +0000 (UTC)
Date: Tue, 10 Sep 2024 21:45:05 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: linux-gpio@vger.kernel.org
Message-ID: <20240910-b219261c0-9b7ee2b9bfd3@bugzilla.kernel.org>
Subject: Test bug, please ignore
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

mricon writes via Kernel.org Bugzilla:

This is a test bug created in the GPIO/Pin Control component.
It is created for list integration testing purposes.

View: https://bugzilla.kernel.org/show_bug.cgi?id=219261#c0
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


