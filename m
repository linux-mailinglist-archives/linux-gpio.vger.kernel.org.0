Return-Path: <linux-gpio+bounces-19346-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9F0A9E3A8
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 16:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F5F13A952E
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 14:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9030B139D1B;
	Sun, 27 Apr 2025 14:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CrHzG1TL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E73A256D
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 14:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745765668; cv=none; b=AUfHx6CJkuoSRRF2ulTlhJzyfObUOAYyUU/6Y+VHNixABqEC8aqeS5KNrX4l9yo0peP9Fj9RX9RrIv/BWFdlqUildt4zVBV1ZtQvWBBHA/iQHVCLWl8d06i2BUR31u5NXfPJMIyKual+RFMB76GeUwNFJ6B4IbM2/sqlAqZ4w+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745765668; c=relaxed/simple;
	bh=laYrnf3yR3FeS2jeck5mT4kP1j7pxLXEV21y0uA3Ecw=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=ut72Ezl6/sHY4rCyEjX7ufU4i0n0hIoKW4gkKeYToOwW0LCbcNhQylb9TeJwwFx3LI0zcIVP9buz8hMfr0MNX6vK6988rhOturWdI2PkVeLti2CZjT097Rfvfnt8xHux47NvD25O5oeo28pLaAEFXgB9C/C7XeqQlftV7wWWceY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CrHzG1TL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF0D1C4CEE9
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 14:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745765667;
	bh=laYrnf3yR3FeS2jeck5mT4kP1j7pxLXEV21y0uA3Ecw=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=CrHzG1TLC/RPxR4Jdi2LzstNi2AO6ozS+HvUMtLkEGeQqZPoVfxe4VpMGjf5pNW02
	 sCzrrt74hJlyDp4qWZWWnLsJh05Qf9oYn40DLPvO29GFhZcV1sXG0J0xdxNnaV5ruH
	 ZIKjnNw7Tlta5HKbepeDotWztf0wpeKGP9xorl8EUeaAVdGrwsLfIxg7dRqry4ofCv
	 LCY66EoftASo/PqNnezR4lbwAGqNC/OEeXgvjpqSQXkGbozb89VCrDJjzgb3w3B/2S
	 gTJDFIuhd4Fl6gUg3xZiJixaAo74gvAHTYJN3MXH0jqe3JoN+GBqGaSDtP05EhoNeu
	 2PX5p22ifN2aw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B1A41380664A
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 14:55:07 +0000 (UTC)
From: Guido Trentalancia via Bugspray Bot <bugbot@kernel.org>
Date: Sun, 27 Apr 2025 14:55:17 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250427-b220056c13-98984dcbfebc@bugzilla.kernel.org>
In-Reply-To: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
References: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
Subject: Re: PixArt touchpad not detected due to wrong pinctrl
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Guido Trentalancia writes via Kernel.org Bugzilla:

Marking it as REOPENED because the issue has not been resolved nor the specifications to resolve it have been provided.

View: https://bugzilla.kernel.org/show_bug.cgi?id=220056#c13
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


