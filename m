Return-Path: <linux-gpio+bounces-29308-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A841CA941B
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Dec 2025 21:25:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BEEC30A7321
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Dec 2025 20:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740FC28D83F;
	Fri,  5 Dec 2025 20:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b="CygHURBL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from tika.stderr.nl (tika.stderr.nl [94.142.244.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14AA261393
	for <linux-gpio@vger.kernel.org>; Fri,  5 Dec 2025 20:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.142.244.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764966312; cv=none; b=efiZd8a78RgRZie/Od6bTposEFlta677SDDvWvOzhB8L32GuLqfkC9lCqyUcK9L9V28K7/v7EUiFGl7FSOZTQHT0z1Kr4N//txv8ivavklCFZWael00Lae8oZBUJc0tvksc5sqpZ1O2TRC3SFeCOvAi8k9gAecBBRUxkhFmCmYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764966312; c=relaxed/simple;
	bh=96tLrf0hdAE4aRsYas0Q2rBM4e2s1cBvFh7Ecq0Y+mI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eW/xdCLuPO5dXz5grcqidyxRk6m143T/Qw2E4m3DBbZJ758VyNsrnAENtksi5qYXyjxZL5I4HLLtM3z3u3nJ9y6jMUy/NHWfN1fKJiFe2qw93zPvAfciQbyjNZ6NXXTUypkfn7bECsGKqZDtpYtclVb1v+jRoHrdC1AoKapcScI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl; spf=none smtp.mailfrom=tika.stderr.nl; dkim=pass (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b=CygHURBL; arc=none smtp.client-ip=94.142.244.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=tika.stderr.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.tikatika.nl; s=201709.tika; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=96tLrf0hdAE4aRsYas0Q2rBM4e2s1cBvFh7Ecq0Y+mI=; b=CygHURBLiO90k2YEkI2s0bwFUU
	tD/llPV5xWBhVl8eCKkhAMFgxnh+eb+qt4/++7yT1tqkgEPBxNsSEDviXQ8LX3lPsSwAtMja/2Q6X
	A4ZUIz6YPq91L83tUNyNXH6QUrtz0G0t4pxq18zjYOCsfW7vhIGIyFxJ9TYtwEeUTwVk=;
X-Preliminary-Spam-Score: -4.3 (----)
Received: from [45.142.19.84] (helo=zozo)
	by tika.stderr.nl with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <matthijs@tika.stderr.nl>)
	id 1vRcCN-00DDbB-1Z;
	Fri, 05 Dec 2025 21:14:41 +0100
Received: (nullmailer pid 2868119 invoked by uid 1000);
	Fri, 05 Dec 2025 20:14:39 -0000
From: Matthijs Kooijman <matthijs@stdin.nl>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: rockchip: Make gpiod pin control work and add gpio-ranges
Date: Fri,  5 Dec 2025 21:06:50 +0100
Message-ID: <20251205201254.2865179-2-matthijs@stdin.nl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first patch fixes pin config (e.g. bias) done by userspace via the
gpiod interface, which was not implemented for all rockchip boards.

The second patch is just because I was messing with this code already
and had a test setup ready. It makes gpio-ranges explicit for the rk3308
instead of relying on the (possibly fragile) legacy workaround in
gpio-rockchip to add them automatically.

I think the first patch might be a good candidate to backport to the
stable releases, since it makes a userspace interface functional that
currently silently fails. However, it is not a clear bugfix and I am not
super familiar with the rules for -stable, so if you think this is not
appropriate, feel free to drop the stable Cc from the patch when merging.

Both patches were tested on a rock pi s with a rk3308.

