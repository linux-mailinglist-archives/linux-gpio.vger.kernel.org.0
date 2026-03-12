Return-Path: <linux-gpio+bounces-33260-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAgMJxjcsmlMQQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33260-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 16:30:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 369E92747E9
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 16:30:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E764B3227B78
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 15:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32B625782D;
	Thu, 12 Mar 2026 15:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="anlMdoQk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A27312815;
	Thu, 12 Mar 2026 15:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773329128; cv=none; b=WaXMaxlSWth69X7rCoMPOPpbz6nCcyW9ma0lVfzmiHDQ1yrcYCYqiC7u+Qi7gpOAmsScZDuBB2oZ8jS50aQxtLNRKyL4tq0jLQ0g4oso4ciU5NMeYy6PzkylR37+ozUmzqJdiqnCXzy1m6/+xJzcDutG8UZm1mRrRMY2dJzBh2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773329128; c=relaxed/simple;
	bh=SPRgYaYcRXRx+Oi439MXJIfPzTvRSwq+RQAg9WxA+zI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjQUhKNWV/Co8Q6wyeraP5/VkdCZ43oPQILNR5H6F/zHu5r64icx9JEjKJ60qJkZsnJMATtYzFGW3KG9KhY1POQHKcA3N6/b8VaLGUaUwP29QPodhMG5tc7Cn5Akc9FOea32FX4F2T6nTVWrU9sKuzfs93W8Q/L1o/X/FA4Oyh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=anlMdoQk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E27C4CEF7;
	Thu, 12 Mar 2026 15:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773329128;
	bh=SPRgYaYcRXRx+Oi439MXJIfPzTvRSwq+RQAg9WxA+zI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=anlMdoQkbijqZRi0VJYy8JBbtdJ99d2UOvXTrDzEOVDqrazZ6mlhAWtuLSpH6Ikm7
	 6ImOvTMCoS58xXWPq/+6X/utGrHIGcvBwgk96I4N/ajMoIwKJWIDLfXvpsS3bO0Z83
	 +sJ9mXNCSi4hN0WN9fqqUgwL9IuxCYcvPync29cfTlZFa3ABCdAWQISQHK5TaAWJJG
	 /ufBzJ/KTQjmlykVtxvcWqUW4jpt4DPDvSNi277E2jEfIykcwedRIG5rdoPgu5jow+
	 qRhOZoI1kNCcfSBJr/EWkoLr8E1m2YGHlpDgWGAhs7hzhZ6qWc0W8GUpMzZu5smpht
	 3wfDkDTqtxj4w==
Date: Thu, 12 Mar 2026 15:25:24 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 5/7] arm_scmi: pinctrl: allow PINCTRL_REQUEST to
 return EOPNOTSUPP
Message-ID: <20260312-abstract-dazzling-herring-94de74@sudeepholla>
References: <cover.1773150895.git.dan.carpenter@linaro.org>
 <e10b198aa9ed7a9cda6d0e9033a00d1c700ecf9b.1773150895.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e10b198aa9ed7a9cda6d0e9033a00d1c700ecf9b.1773150895.git.dan.carpenter@linaro.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33260-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,arm.com,vger.kernel.org,lists.infradead.org,kernel.org,intel.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 369E92747E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 10:39:03PM +0300, Dan Carpenter wrote:
> The SCMI protocol specification says that the PINCTRL_REQUEST and
> PINCTRL_RELEASE commands are optional.  So if the SCMI server returns
> -EOPNOTSUPP, then treat that as success and continue.
> 

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

I see Linus W has provided review tags too. Though I am assuming it will
go via some other tree as SCMI core change is tiny, just wanted to check
it explicitly so that there is no wrong assumption on my side.

-- 
Regards,
Sudeep

