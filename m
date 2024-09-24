Return-Path: <linux-gpio+bounces-10408-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 544A2984C18
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2024 22:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4B31B22740
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2024 20:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CA5139CE9;
	Tue, 24 Sep 2024 20:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a200A4Tr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9687513A3FF
	for <linux-gpio@vger.kernel.org>; Tue, 24 Sep 2024 20:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727209212; cv=none; b=EIXlzmUnd+tizKkRVmHCBXOuRmwIGzJ7z8gIxaKLWmVLlnPXOFpdot6iv2rIuIVhMxh08FgQzza45lYmGH/HCxCg2FRVUpkenOb/AsBMJf4F5dtURDQcXgQPMpM02sTzD//LGHHLnIdlQx54Qf+Zhb5HmdBGuU037Vj7GIQHzQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727209212; c=relaxed/simple;
	bh=fRNhapprW8dOwG13H8JBaz3sfsohRtOOnNhGRgA1Tds=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=sAiPeaKyxidu/1EMFlyAZ4J7N9Pzw9Nt3Tr+ys3rOm3AzM/s7S2KASSbFVu5OFY9qMty75t51s/LEFxn8tYz0gH2DAfSDnByI3rdWbfLPzB49dHx9rtIgbvaLF8Pw3jHcjIyA5q/FsOybBFW+FAGyXMT8ClsKApX89mA3VJ58gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a200A4Tr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D34C4CEC6;
	Tue, 24 Sep 2024 20:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727209212;
	bh=fRNhapprW8dOwG13H8JBaz3sfsohRtOOnNhGRgA1Tds=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=a200A4Troz2vNdHEqF7sRWiKtichk0pUlfLQTqcXIRh6cXOPJZ6Xa8Ixzvu9S6RPJ
	 FMctMTZQg6I/8kt+Tnis6rW5vn1/NFsezghoKaLKL4JQ+l78oZY8M4VjXShQj/KQSJ
	 V8w8pF8AcNUdqRst/0HPU2HlJF34mvxUbSwWNFnrMkFn1uw7TXDt3PhKcFyFW0bVKU
	 jYN2RVF97+LjbDldaXIPgch/jH95aAnp4mOBC5mhzzWu9LejXPAuaQ2y8mBpnaoI5f
	 ybY9IuJsV4JDexNR3fObqHhmZ0VHwXUQq3UvHMVaZK5YVcPx931fhnOgBTTJ7OcUrr
	 0zDIVklrixi5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BBACA3806656;
	Tue, 24 Sep 2024 20:20:15 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: hal.feng@starfivetech.com, helpdesk@kernel.org, kernel@esmil.dk, 
 konstantin@linuxfoundation.org, linux-gpio@vger.kernel.org
Message-ID: <20240924-b219312-b606ee0b7a3c@bugzilla.kernel.org>
In-Reply-To: <20240924-discerning-benign-labradoodle-a9b7d8@lemur>
References: <20240924-discerning-benign-labradoodle-a9b7d8@lemur>
Subject: Re: Bouncing maintainer: Jianlong Huang
X-Bugzilla-Product: kernel.org
X-Bugzilla-Component: Helpdesk
X-Mailer: bugspray 0.1-dev
Date: Tue, 24 Sep 2024 20:20:15 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219312

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


