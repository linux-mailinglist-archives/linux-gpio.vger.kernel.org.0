Return-Path: <linux-gpio+bounces-34206-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPmCLBQhxWmC7AQAu9opvQ
	(envelope-from <linux-gpio+bounces-34206-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 13:05:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 963D9334EB9
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 13:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5AFA03038D46
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 12:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F4A3988E4;
	Thu, 26 Mar 2026 12:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FSgCAk+Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58A1382F0C;
	Thu, 26 Mar 2026 12:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774526618; cv=none; b=uQaXNBR5+whrRMtfD22797aaBF5Vj7uydKrUKxhApW2X5+AIOmtCVD14P/PDQQfhvsHiHEc1u80S66wc5N93tp07/HXe1hpwzsxTpVUdyn32evoStbGUhHQHifE08Ku8W9jUSYXILH0ygqffZmUrLCe/67odU4He+VfhKyUBfn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774526618; c=relaxed/simple;
	bh=nXhBTq4rlMGq3oWCWKDipgnde+DqeqIFykqfsBS8++M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gsxKLcEjn3mYLwgMmwb23uF/fDzRZSoDMSk5/QV0YXPPZySBEcJ+MhMXpwPQyKrLX7EgbbHDsSE0H+U1Y0pp1THNshNyU6/Id4Q0DrlTYuYgzs3sDSocHmSiaJlfUu5jtw92pcrAV0ak6D1SHCRS7KXpQqB8riGga9YYL7CXb2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FSgCAk+Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2684DC116C6;
	Thu, 26 Mar 2026 12:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774526618;
	bh=nXhBTq4rlMGq3oWCWKDipgnde+DqeqIFykqfsBS8++M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FSgCAk+QgxiULXZwRGkDHP/fy1R47SgqrJ3PstxUiF+M415/SNMLm649aFGuJQ3/2
	 jCXJT4qtG+0DoAfEFASVDyDQY34+eDl588ia0DRor4y/vPpo2nPmIayr59PMDkeMJY
	 Z4YEzHlaOqXQ6kOKZwM+4zoiQF40FUd+66rVNlwNHRdwUV3GscWJPf6XddN/mhrr1y
	 gpvs/1rOWpOkw4lcAe2nZ5Cy02liIcEUQ9uvb6bQRTjQbUMgl+k7Chc2Y6HLhpIu9F
	 yYfVmGJezaLAstBVGCJwpRz5XTsMO/8BKIjTyumvhKNC3oYpaOS5JxdAaDs90IQeZ+
	 LBsnsa2GppHiA==
From: Lee Jones <lee@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sebastian Reichel <sre@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-pm@vger.kernel.org
In-Reply-To: <20260316-gpio-of-kconfig-v2-4-de2f4b00a0e4@oss.qualcomm.com>
References: <20260316-gpio-of-kconfig-v2-4-de2f4b00a0e4@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 4/9] leds: Kconfig: drop unneeded
 dependency on OF_GPIO
Message-Id: <177452661287.1970463.2525511615617194577.b4-ty@b4>
Date: Thu, 26 Mar 2026 12:03:32 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,redhat.com,linux-watchdog.org,roeck-us.net,linuxfoundation.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34206-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 963D9334EB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 16 Mar 2026 10:45:24 +0100, Bartosz Golaszewski wrote:
> OF_GPIO is selected automatically on all OF systems. Any symbols it
> controls also provide stubs so there's really no reason to select it
> explicitly.

Applied, thanks!

[4/9] leds: Kconfig: drop unneeded dependency on OF_GPIO
      commit: b727ba2560a8a806680b45c9acc5a49bc39b8e43

--
Lee Jones [李琼斯]


