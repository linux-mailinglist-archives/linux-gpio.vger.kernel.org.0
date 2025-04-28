Return-Path: <linux-gpio+bounces-19428-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C42A9F5FE
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 18:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A68883B77B8
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 16:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B16625D8F7;
	Mon, 28 Apr 2025 16:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ERcpSoU9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A43384A3E
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 16:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745858368; cv=none; b=MqQbljzF69hR/Lxi0eKXByRHq7hMvsDyUblMBW58EWpcjqJpL2BAVwvJBo4DmnxAtyTHi4z3qJkis8QZjroaHHiPrr0wtj+EsFG8VDnslzcEqUte1vlongIs9Olm77OBowCQy1WLxd1QTXBFUAhm8QMu3eU5qfdJD/YQEHJ0eNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745858368; c=relaxed/simple;
	bh=25NNMSU35TdRow5pO8+OP/fpYx3WntI/CO74BlvWRjQ=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=Oz8ETNdby8NO34WD3AtEAZjEsR2nkV/lgjY19A5lWWTOMxt4qJsyjgkeeG8pujJYrZULjPJVCNK2We9Bm7Zf9aQdrIU+KS9GntXBCy99C/Kha+gJ9GVJLagvqK2s3JOd378Hj35sScuPX0meejg1+HkWXkt+BIDlsUCULloask4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ERcpSoU9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2DDFC4CEE4
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 16:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745858367;
	bh=25NNMSU35TdRow5pO8+OP/fpYx3WntI/CO74BlvWRjQ=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=ERcpSoU9b6nrfBGWOVTGgkmGB8Gvr65SnBliEnewJwXlaN4V5Gah/pRED1nAux4LJ
	 2+HekPbAE5FTqbztfEI6JljVOhFoIu2eI1fNiFF5sHmo2ST7SzWHXYcleGbmnj0hT0
	 kOvsQWNokMs+MBVqS0blEn+zWkz5XqfiNNaWrCMpWqwIx1sGXoEzKAK5Oc972aMISS
	 YkMaTCuYy4WP87ljbd2FxiHGBkFqZggxtVTgRiv2EOnIWnoGzKm1OJL6u8yQvmHsWK
	 Xe2rnVGuocrZTo0vBYMtHiL3A52tWqcc3TozjWyh4SuTN1rzsXBCk8JRAZW2e9pznd
	 maji/Ywywny+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B589D3822D43
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 16:40:07 +0000 (UTC)
From: Andy Shevchenko via Bugspray Bot <bugbot@kernel.org>
Date: Mon, 28 Apr 2025 16:40:29 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250428-b220056c25-ce44a9f19962@bugzilla.kernel.org>
In-Reply-To: <20250428-b220056c24-2e71448ee1a1@bugzilla.kernel.org>
References: <20250428-b220056c24-2e71448ee1a1@bugzilla.kernel.org>
Subject: Re: PixArt touchpad not detected due to wrong pinctrl
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Andy Shevchenko writes via Kernel.org Bugzilla:

(In reply to Ariel Simulevski from comment #24)
> Hi Andy,
> 
> Would it be okay if I prepare the documentation patch?  
> I’d love to use this as a learning opportunity.

Sure, it's low priority for me, so you have your time (a week or a couple of weeks) for that. Note, if you wish, you can also investigate other drivers that support more than one generation of the chipsets.

View: https://bugzilla.kernel.org/show_bug.cgi?id=220056#c25
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


