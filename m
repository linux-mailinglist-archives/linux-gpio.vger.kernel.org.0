Return-Path: <linux-gpio+bounces-33257-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GL0ADHXasmlMQQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33257-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 16:23:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE9F2744AA
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 16:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A803B31BAF01
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 15:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01DC63806CA;
	Thu, 12 Mar 2026 15:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BV0DPB21"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABC5363088;
	Thu, 12 Mar 2026 15:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328822; cv=none; b=hbvjzscRUer26UmOzJLp653MIxT7W5sw0c7Sqfs1hekE/UN06OsbBwcsno4uzfMKs3SZjLo7Iewx/3H1DMtXx7MXBTycXhA7hTY703SNIwlJvN/Jlbas95xW9iv5rP25JiYshBZcr7mW/2Py8V1padgjTV3tuEmSSEbf2hNtON0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328822; c=relaxed/simple;
	bh=Xvvqigd/C72hQn6+zvAtVN5LFK4kwcjRIl94MgCX2LI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URhCw3y+3GTZiFWJthP547tfgyWBPJ11M4OMwXkKQRs7u/gh3Dha/RlUoxXreKsMxBptyLAQN3M8QDebsP4nrOhlhHRJChotAnigwefyMZaEMkBNAxp72T4GTYNJI6ZgMDu0omnPOAAgDZFJx++YYBwkoOIblJ+dFNWH/MCp/I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BV0DPB21; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43ECAC4CEF7;
	Thu, 12 Mar 2026 15:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773328822;
	bh=Xvvqigd/C72hQn6+zvAtVN5LFK4kwcjRIl94MgCX2LI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BV0DPB21yt4s0Sd0hOBwLqTu+Q+SrUgFRQG13X6r/TkZvSkb+jV3uWNbYVb3o8lf0
	 2mbF6jYu7LcbKQtz6mhc3byhydMLF39ooQljk0Ct+AJaXEIyAnUU3c+g2e5pyMWYov
	 dPVLseMg0NvWlRHwKhDEv3XGAtAyRCSERmNyQCyg=
Date: Thu, 12 Mar 2026 16:20:17 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srini@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev, linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v3 15/15] hwspinlock/treewide: refactor consumer.h from
 public header
Message-ID: <2026031210-abdomen-armed-ad22@gregkh>
References: <20260303192600.7224-17-wsa+renesas@sang-engineering.com>
 <20260303192600.7224-32-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303192600.7224-32-wsa+renesas@sang-engineering.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33257-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,huawei.com,linux.alibaba.com,infradead.org,redhat.com,lwn.net,linuxfoundation.org,baylibre.com,analog.com,gmail.com,foss.st.com,arndb.de,lists.linux.dev,st-md-mailman.stormreply.com,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CDE9F2744AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 03, 2026 at 08:26:07PM +0100, Wolfram Sang wrote:
> Factor out the entries only needed for consumers from the generic public
> header. This allows for a clean separation between providers and
> consumers. Also remove contact field in favor of MAINTAINERS entries.
> Fix the users, too.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com> # for IIO

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

