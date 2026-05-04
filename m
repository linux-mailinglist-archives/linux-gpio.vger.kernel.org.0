Return-Path: <linux-gpio+bounces-36033-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOdnLNxe+GlJtgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36033-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 10:54:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B844BA9E4
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 10:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9039D3003D0F
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 08:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52463347507;
	Mon,  4 May 2026 08:54:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D313451A9;
	Mon,  4 May 2026 08:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777884888; cv=none; b=sA9dWnRZBzJ/trDalM/zHykq7njClPZg/zgMDFNlFHvYUhD505qUR/emHZfpNnkzl9kvhLT+PQioSH+Ck9rdZgG6B6z8lKX6Qry3mmLfcMH8XnGVR5BUmsJjtS6tgdPo0+yFYXT0xQYIKF2576xCE4JJLPKSAQyL+QGpQvW92Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777884888; c=relaxed/simple;
	bh=kGQNFOPhDz5o5cnY0MivHy+uV7bzmU0yYLIXcs1uC9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fkk5bFiCaUNRX4Zr9IRIOxNmbl9MtIpNbpc1d3NhDSwwZ9KVsWpdGUUt/Vhl3jZwnOtrOSO03fC9eY89EcoBAXE3GOlxbnfE1qieLqBqnvLARN7zxR8qJkfBuPt0bM4tp0fLAwby/Py1sNpgDr6hncThYcSdxQCCzJ/WiHJ7Eig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gnumonks.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gnumonks.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from uucp by ganesha.gnumonks.org with local-bsmtp (Exim 4.96)
	(envelope-from <laforge@gnumonks.org>)
	id 1wJolU-006U7Q-03;
	Mon, 04 May 2026 10:34:56 +0200
Received: from laforge by localhost.localdomain with local (Exim 4.99.2)
	(envelope-from <laforge@gnumonks.org>)
	id 1wJolI-00000006w4B-1Owb;
	Mon, 04 May 2026 10:34:44 +0200
Date: Mon, 4 May 2026 10:34:44 +0200
From: Harald Welte <laforge@gnumonks.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] mfd: ezx-pcap: remove unused driver
Message-ID: <afhaJNqj5j_V7qLw@nataraja>
References: <20260430162855.2029285-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430162855.2029285-1-arnd@kernel.org>
X-Rspamd-Queue-Id: 26B844BA9E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-36033-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[gnumonks.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laforge@gnumonks.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arndb.de:email]

On Thu, Apr 30, 2026 at 06:28:05PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Support for the Motorola EZX phones based on Intel PXA processors was
> removed in 2022, but this driver remained present in the tree. As far
> as I can tell, the support was never quite functional upstream because
> the board files did not actually instatiate the SPI device for the PCAP.
> 
> There are still also drivers for the various mfd cells: keys, touchscreen,
> regulor and rtc, all of which are obviously orphaned as well but can
> be removed separately as the Kconfig dependency now prevents them from
> being enabled.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202604301209.f1YXTsIr-lkp@intel.com/
> Cc: Harald Welte <laforge@gnumonks.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Harald Welte <laforge@gnumonks.org>

-- 
- Harald Welte <laforge@gnumonks.org>          https://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)

