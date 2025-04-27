Return-Path: <linux-gpio+bounces-19349-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FC7A9E43C
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 20:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EF793BBD4B
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 18:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074441DE885;
	Sun, 27 Apr 2025 18:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PAa32Tg6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0330288D6
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 18:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745780369; cv=none; b=mKulv8h0+tMBdT73QDIFxx/Ia9j2oCpKpAZgOucC2yNbG+bEKSrDNo6DhBQO8QozRNHpes1Y/YZfNgmPMJKZlzDhMo8gjUuxdQfPBUMib8z4NTm3tDo7c3wxOJfrlT63FznnxNC4+HXlgyJEaMstKIRqz112tU9aFE2B1d5qcIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745780369; c=relaxed/simple;
	bh=ZuqsqmLG1JnMvtEqq+3ZmZceCCsOFV/tCJAckL0fkEQ=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=jKBbYHn6AKPN4ojqj7zpDuiXvifsecaaRP/T7YMeJDBp+jdVJPLDuwrfflJRcloYmru637Y9YhBrkYaC5ALOV8JpXaRTCY791wWJLB7KT+PE6hS3jSMyGdDmxqsxexY2JkBUnMvwjpFQC3mYr5LhIG9/1E+GWE5snSLjD5kOiP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PAa32Tg6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33452C4CEE3
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 18:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745780369;
	bh=ZuqsqmLG1JnMvtEqq+3ZmZceCCsOFV/tCJAckL0fkEQ=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=PAa32Tg6xpoEN/wQ+qPiO/2ht5s6VuaAZDnvctqD1NW3STqOkWINzl54FmRcuZeOI
	 2f2OZuxM/tn59bZOYvhUgUohnVDIfnW2ysCagkI4GsflE1J78VR/UbCyjgCQxaJ1Ns
	 S+dDFwurGfwKpC7ACUsSK15s8aSjE86RwOQVIMOD7RnL/f28upu6Vyt/Qm0DHpHdA6
	 oi2ooW0iUCxjxM2XGZFo6P2GPjLIANNaQK7jw0BGBl+LlQxe/5N5jQgJBOHlSVp72w
	 b5B0jEVVezWe7csXHX6BZZvZ4YpWeq1sJTqlKQ71gaKdUwJLukTqJypmTxh0Sll5Yx
	 oN/mn5B9FAbhw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E2C380664A
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 19:00:09 +0000 (UTC)
From: Andy Shevchenko via Bugspray Bot <bugbot@kernel.org>
Date: Sun, 27 Apr 2025 19:00:20 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250427-b220056c16-ef68e72c21e3@bugzilla.kernel.org>
In-Reply-To: <20250427-b220056c13-98984dcbfebc@bugzilla.kernel.org>
References: <20250427-b220056c13-98984dcbfebc@bugzilla.kernel.org>
Subject: Re: PixArt touchpad not detected due to wrong pinctrl
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Andy Shevchenko writes via Kernel.org Bugzilla:

(In reply to Guido Trentalancia from comment #13)
> Marking it as REOPENED because the issue has not been resolved nor the
> specifications to resolve it have been provided.

What *issue*?! The provided patch does NOT solve *anything*. It makes things worse. Please, try to explain the issue here, as I am completely out on what's going on here. Currently it's all red herring.

View: https://bugzilla.kernel.org/show_bug.cgi?id=220056#c16
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


