Return-Path: <linux-gpio+bounces-11653-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD809A4B28
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Oct 2024 06:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E38501F2281B
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Oct 2024 04:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5644D1990AD;
	Sat, 19 Oct 2024 04:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=strongrootsfitness.com header.i=@strongrootsfitness.com header.b="WzuUz26b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from seashell.cherry.relay.mailchannels.net (seashell.cherry.relay.mailchannels.net [23.83.223.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBBE2F2F
	for <linux-gpio@vger.kernel.org>; Sat, 19 Oct 2024 04:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.162
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729310627; cv=pass; b=tDTKMG0uCSufqrF3akaFq/wtv82sCH9zOYmd+KOBEoE9GvIGfUIwtCu6E5fG3710EJq5E7/E5Pg0jf2wxLkvULRNagAkFRxdV232Xb56hQi9q2ldksJr1vWn6BBQZU+xAcuoG0qfzVm3DWkEb3z+lhX/gNLvZOFggBOIR6snV4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729310627; c=relaxed/simple;
	bh=hA6wYHEZKzuTw5dbik0mh+mYyHqkiNGEn/o6h4wHxw0=;
	h=To:Subject:Date:From:Message-ID:MIME-Version:Content-Type; b=oeU4ueMWAn9j1oD/v8V2twGzu2XCmO78yN2Nw2SqXjKgR9oNsHVqWwoE2du6nRhESl/b/s1luV6BLoHC3TMe2Vh5DUJ5FnaMh4B8+CUYZzxbidXeI1vYANUwXwmxIChEScSJOGQMPZfXj+p/QNbEGGZAZ0D4y92OnYvhLu/K+38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strongrootsfitness.com; spf=none smtp.mailfrom=rs8-nyc.serverhostgroup.com; dkim=pass (2048-bit key) header.d=strongrootsfitness.com header.i=@strongrootsfitness.com header.b=WzuUz26b; arc=pass smtp.client-ip=23.83.223.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strongrootsfitness.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=rs8-nyc.serverhostgroup.com
X-Sender-Id: 8xbl3cp958|x-authuser|strongro@rs8-nyc.serverhostgroup.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 0726F8C58CD
	for <linux-gpio@vger.kernel.org>; Sat, 19 Oct 2024 00:37:09 +0000 (UTC)
Received: from rs8-nyc.serverhostgroup.com (100-99-209-111.trex-nlb.outbound.svc.cluster.local [100.99.209.111])
	(Authenticated sender: 8xbl3cp958)
	by relay.mailchannels.net (Postfix) with ESMTPA id 6C5548C5992
	for <linux-gpio@vger.kernel.org>; Sat, 19 Oct 2024 00:37:08 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1729298228; a=rsa-sha256;
	cv=none;
	b=xkzv8ER6F9SpUod3FYs/SKY6xJM4NoQlkSIwM+Ekzv4csTlVsjRdBbhSkuriOZR2ITZQ8R
	LgMRHSpecmJp+lRWU4rvjzAk5qDWruQ8LWA5piZsseVyWXO2Uw7BeOoE++hyUFPjOITVis
	4B3+Xwn7iZaQEOH3r6O9QqRpNsK+CEtsrq5VhY0HSnYHQpAInu+5oS9h3WFKJa38vDPMqT
	au0XQJAjF96zQvPDo63id6VaA4WNyfZfrMjTubO2AZAytU2rsGRLlaHxtHeZsJnVFFCHKG
	f+ZlbRNVQGe7nICdNpQk9PfopcJ2sglIQBUJY9vn6VmoEfADPwwvR5viIBi3ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1729298228;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:dkim-signature;
	bh=nC94GJL6MkfCTMHo3VTLQw6AH1h4xFoW2UTud3diDUg=;
	b=aKMQGz6Yqj38xJ+PmsKHr16kZck4Yq8/wVnmTYMMUWrYzXUFg43BAxhCNeTRO74zeCfW6O
	w9APmf69grUb5j1GUZjB1Sp3bmgAjfEfVSi/nzyqVLyx9M2S3DmXnP5/U9TnlkUGy2JGZT
	G2fwvyLvociXuVe+jPL6WE3HyiIaZYUWwwrVb4wXTskVrgMOIpNMsn64hY4WFWwznqIoS0
	f/H0ANtxFLoAKKWfwQfPfcw8/YXhPksN2qLkspmoVLeaO2/o2yWcWpe/jyzV/IN+OOjKDv
	45pwWrFOU/Z+ym2yc4Ic5tcCWD+Zb6JTyjvWeyxLrBWn7xUhRdABfw0vuG9Qxw==
ARC-Authentication-Results: i=1;
	rspamd-75d86777c9-tmxs8;
	auth=pass smtp.auth=8xbl3cp958
 smtp.mailfrom=strongro@rs8-nyc.serverhostgroup.com
X-Sender-Id: 8xbl3cp958|x-authuser|strongro@rs8-nyc.serverhostgroup.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 8xbl3cp958|x-authuser|strongro@rs8-nyc.serverhostgroup.com
X-MailChannels-Auth-Id: 8xbl3cp958
X-Cooing-Army: 341f128752c5f515_1729298228916_1957228305
X-MC-Loop-Signature: 1729298228916:195092546
X-MC-Ingress-Time: 1729298228916
Received: from rs8-nyc.serverhostgroup.com (rs8-nyc.serverhostgroup.com
 [23.239.10.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.209.111 (trex/7.0.2);
	Sat, 19 Oct 2024 00:37:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=strongrootsfitness.com; s=default; h=Content-Type:MIME-Version:Message-ID:
	Reply-To:From:Date:Subject:To:Sender:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nC94GJL6MkfCTMHo3VTLQw6AH1h4xFoW2UTud3diDUg=; b=WzuUz26bqV4t8OO5IzX8AcuNpB
	QpA6H5A57DMWE3Bk7BWAHAE6bFLpnnfi4d+mhjmHNlzAyUNglFPQLBA8mI7gp73uhQ560xFEhZj3t
	Ru5rVqV4k8U2EbzZ9bA7LrDWa1YcxSKhvR2LdnlVZb4fBRSu5U9OqTWBVSLXmoK3mHpvYXjcUZsa0
	ewDLXQbLGIUpMaLPCwoOc3SSFnqPJtSX/lEIb8O6xMEQoT2OhFt4h+V+oYuTG6Aruvsc4wS79HYLA
	7TO01hWVyvW9Rxzzxx+4UlGAc1YFmrKKwK6Cb7hWDOunbt100ysnmmTfPnF4z/vBO/i2TE6/1BYh8
	nEuqj3zA==;
Received: from strongro by rs8-nyc.serverhostgroup.com with local (Exim 4.97.1)
	(envelope-from <strongro@rs8-nyc.serverhostgroup.com>)
	id 1t1xSt-00000000H5B-2Wx8
	for linux-gpio@vger.kernel.org;
	Fri, 18 Oct 2024 20:37:07 -0400
To: linux-gpio@vger.kernel.org
Subject: Strong Roots Fitness - Thank You!
Date: Sat, 19 Oct 2024 00:37:07 +0000
From: Strong Roots Fitness <sales@strongrootsfitness.com>
Reply-To: sales@strongrootsfitness.com
Message-ID: <4PYHX6oJZ1ZdB2lL2oGuz0aoxy20M9a33T3yq4PHb4M@strongrootsfitness.com>
X-Mailer: PHPMailer 6.8.1 (https://github.com/PHPMailer/PHPMailer)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-AuthUser: strongro@rs8-nyc.serverhostgroup.com

Message you sent:
From: Your account has been inactive for 364 days. To avoid deletion and claim your balance, please sign in and initiate a withdrawal within 24 hours. For assistance, visit our Telegram group: https://t.me/+21H-sSkFOfUxYzhl <linux-gpio@vger.kernel.org>
Subject: Your account has been inactive for 364 days. To avoid deletion and claim your balance, please sign in and initiate a withdrawal within 24 hours. For assistance, visit our Telegram group: https://t.me/+21H-sSkFOfUxYzhl
Name: Your account has been inactive for 364 days. To avoid deletion and claim your balance, please sign in and initiate a withdrawal within 24 hours. For assistance, visit our Telegram group: https://t.me/+21H-sSkFOfUxYzhl 
Email: linux-gpio@vger.kernel.org
Phone Number:86416482791 
Message:
dfb9psj CSiJ thgDDvZ UfZ6svl o7j0 rom0FWp

-- 
This e-mail was sent from a contact form on https://www.strongrootsfitness.com/


