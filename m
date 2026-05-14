Return-Path: <linux-gpio+bounces-36840-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHkVLYq8BWpZaAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36840-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 14:14:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E316541707
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 14:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9FA99304545A
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 12:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899E53C98B9;
	Thu, 14 May 2026 12:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EyEFXfAr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498733C8C68;
	Thu, 14 May 2026 12:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778760827; cv=none; b=neSPipQwoyBerU8v7WRN1ZWZDQgY2vn4RoMMrr1fR+yhWL6JpTma7AedLzMjRSpsIPcmzxMQ5CG+bUDc0ZUdrSWfLeZlOaUouJUPmY1iRTDXwNr7hvxELR6FqUDx5FOBdiC7DTstXhtd47GMYU8r3a35+q/A/IehyF1OMReF6Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778760827; c=relaxed/simple;
	bh=qOjySuzo217jJkiqCYZDHsfK1Tdo3fmkF19sRxUfY3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pB+91nWJFD8kzo1yW8wEYnLqbiiaSb2fgOEAc1F3uI1JGkCeWgCPKckYlG1hDAnnW4grRetvYz80D4mpAKF6md4/sCPcxfFWnACKKkEMahFc/T9kw4jEJzxbcWSEbkNL4Ah6vCIVs0P4wyRpulShZjuhrvrqYqOoPoEJbhdmI4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EyEFXfAr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB68C2BCC7;
	Thu, 14 May 2026 12:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778760826;
	bh=qOjySuzo217jJkiqCYZDHsfK1Tdo3fmkF19sRxUfY3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EyEFXfArX/1/6PYRwL8CcUDsRK6fXx44WpdTLyrXuvHjHTXmRM8kRh6byLMMC7aHp
	 s2+eJsSTo3fU4sLH68b8UqSrIQ7fuHQXhwLravLU2xJdk5JwhBmbO7qASVwCsEjtsb
	 CppKVVjfTbLr3PCMUMTjysXmup5zu+pdHwxij6JxkaxwOQ5RQ1eKbIvuknq2At2+8p
	 g9jIzBLHTtFnLcRAijjqpZMZkQbnPN/6iha0IeBFpCFgBKix6CdXQX4DAGQNvwj45q
	 76IEFzmKd3R5kodHBgo8jjr4qBQq56TrFDNzKI4Sd5LKSKlw9nRittzM93DYMr+CIu
	 hl4wEeQFc+Z3A==
Date: Thu, 14 May 2026 14:13:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandre Hamamdjian <azkali.limited@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, CTCaer <ctcaer@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/3] usb: typec: add Rohm BM92TXX Type-C / PD
 controller driver
Message-ID: <20260514-impressive-lush-partridge-76ed5d@quoll>
References: <20260511-bm92t-v2-0-2145e4f4386b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511-bm92t-v2-0-2145e4f4386b@gmail.com>
X-Rspamd-Queue-Id: 2E316541707
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36840-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,linuxfoundation.org,gmail.com,kernel.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 01:32:08AM +0700, Alexandre Hamamdjian wrote:
> This series adds initial support for the Rohm Semiconductor BM92TXX
> family of USB Type-C and Power Delivery controllers.
> 
> This chipset is found on Nintendo Switch hardware, where it handles
> charger and dock USB-C / PD negotiation, DisplayPort alternate-mode
> entry through the dock and VBUS / VCONN control.
> 
> Further patches will follow to wire the driver up on Nintendo Switch
> device trees and to address review feedback.
> 
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> ---
> Changes in v2:

Please start testing your commits before you send them. Also, read
submitting patches in DT subdir and writing bindings documents.

Best regards,
Krzysztof


