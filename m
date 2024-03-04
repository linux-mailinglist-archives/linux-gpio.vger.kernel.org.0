Return-Path: <linux-gpio+bounces-4090-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D45B986FC73
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Mar 2024 09:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 120E01C21E2C
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Mar 2024 08:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C1438395;
	Mon,  4 Mar 2024 08:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crafticoz.com header.i=@crafticoz.com header.b="TfSgjU80"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.crafticoz.com (mail.crafticoz.com [217.61.16.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C14420315
	for <linux-gpio@vger.kernel.org>; Mon,  4 Mar 2024 08:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.61.16.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709542270; cv=none; b=H2txOKTSi6DJwLHtqMZcdSLEfc5B0sZjp8LA1MEinnCJ3Q2Ymc9e7l/Trnc5ufm5t7aUbHu8sqhYXByXdiuuGCaAnWna80yivJLTLXOAbTRmbKHx+k421B3x6zDbiMiIwSrznudncNgfpfCN0190TwYoYfnSrBiiSjUilirbsdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709542270; c=relaxed/simple;
	bh=1IoqoUjByUuGlvKIsPqzKB660hvTAuw0hON+G/wNfyM=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type; b=DnLBZ+y1uCyJCz87WUTw2RH3crm3ab1J1XvkBkDORa+EO5FiSI2dYItS5hA48ZnSTj0a6pv6xxwtSIhhjXCPTWUUvy/C0gocb9bo6PqvGCExJpL+vssZpuOIhUFIGj5Bwv4p2+6tgIPGrqUHhjd/G5t7wmiohmbpoAugeaBJmZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crafticoz.com; spf=pass smtp.mailfrom=crafticoz.com; dkim=pass (2048-bit key) header.d=crafticoz.com header.i=@crafticoz.com header.b=TfSgjU80; arc=none smtp.client-ip=217.61.16.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crafticoz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crafticoz.com
Received: by mail.crafticoz.com (Postfix, from userid 1002)
	id 8196C825FD; Mon,  4 Mar 2024 09:51:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crafticoz.com;
	s=mail; t=1709542263;
	bh=1IoqoUjByUuGlvKIsPqzKB660hvTAuw0hON+G/wNfyM=;
	h=Date:From:To:Subject:From;
	b=TfSgjU80M3ldZVjM3upOvwaBSSi3UDCbcJJDUA3t8MgtKbh86Fbld+JjzBQvx3Vwe
	 Ob0cCmq9CpriPpIBiSCcpxxmkJkYEGsu/Tpiejf1WeZ7JybK+EgWMPyZrH/3PLIMa6
	 AdFeTY4cCmkIsTxObxkOrdP+arCWjWbFBoPdp4e2v4Uc+krRu6JU39/BxP0GcQvXZx
	 uqkwL6gC1w6HLIyirDxzIBToLsXTUf5Jz7UaVxFclp7/ROF6vZyUnUUPKzG2nyV7VC
	 hRN4G5o8K9A7tgshbYAj9CQKQZbh3mev9XWQQEGXPLhpfJvM60BE9icLyLa8Hc5vx+
	 fShRnlTNJv6MQ==
Received: by mail.crafticoz.com for <linux-gpio@vger.kernel.org>; Mon,  4 Mar 2024 08:50:59 GMT
Message-ID: <20240304084500-0.1.18.3j67.0.cme0y3o2ka@crafticoz.com>
Date: Mon,  4 Mar 2024 08:50:59 GMT
From: "Maxwell Atlee" <maxwell.atlee@crafticoz.com>
To: <linux-gpio@vger.kernel.org>
Subject: Development of new flavors
X-Mailer: mail.crafticoz.com
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Are you interested in expanding your offer with innovative food products?

We offer freeze-dried fruits and vegetables in various fractions and orga=
nic and conventional versions. We mix and pack our products, delivering r=
eady-made mixtures for direct use in production.

They can be added to various food products, from breakfast cereals to ice=
 cream, which gives a wide scope for experimenting and introducing new fl=
avors and a completely new range. We provide support in developing the co=
ncept and turning it into a real product.

I will be happy to provide you with details and provide samples for you t=
o test. We can talk?


Best regards
Maxwell Atlee

