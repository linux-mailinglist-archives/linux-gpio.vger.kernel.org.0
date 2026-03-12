Return-Path: <linux-gpio+bounces-33254-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPwFLVy6smmvPAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33254-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 14:06:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A8A272457
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 14:06:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDC90301BA63
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 13:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472B93C4566;
	Thu, 12 Mar 2026 13:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rpzIOYW3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A24A2BE057;
	Thu, 12 Mar 2026 13:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773320760; cv=none; b=aZV4IXUmgiAgdpMHdftO3XXth8m6UVwjg64CR59MQ04Kezr+anB8dEnTxop/1pbvyOdFV/U/xH3ZSfoxPg5DNp9r7jR73WnncT0qlNrM3+VMGz37xFVdWjd9sbDQJkARmUsECemtWeGl/ATkHN0DLB+EhaZ/87lGWwFKd0LbYdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773320760; c=relaxed/simple;
	bh=RS2eD/u5KdiyZIBjmJ+P1L16Vigc+mnaRC131TRskaY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Wqb4ao7hyY8oSwJoT8E7Vrvjg0+SgCEavK86ljUBeCV+Y4dASjFMYM540enqA/Qj3iLhPa37AstmrCsVyS4Uou5XF7k22ShjwY2yBpQapSLlx1AlrvWxdeMuf7yIjvQaTWO7+kSTBrUojHv4yRB1U0554P+Vs3EIcHvZsd36B34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rpzIOYW3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87DC1C4CEF7;
	Thu, 12 Mar 2026 13:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773320759;
	bh=RS2eD/u5KdiyZIBjmJ+P1L16Vigc+mnaRC131TRskaY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rpzIOYW3LUc2o06XyOPlrOazZhAHw3eTnZ20vqpctneBSIQykEZvjf8EhLuKtbbVW
	 3HRbCOoX3pRc88/ABz1OvXJFalcYxkpmxc9akz7PpJrdYyGfVYZ31szNLeq7n9BFEx
	 Sws0BT5nVurPhjfVu0TK+EZ/o3dEeLqlfUm7LbP/y/sp/9pBbdVh8+adfKUHWzf0KS
	 nl7z5nnPdvSCbaXdiEwKtd+WaYUuBqD/1h/bs+xyAhRD9GjI+tCBdvg4LQTGFIUCF/
	 whEZQlYSPwtm17rzhkpefBEWCoazYFChhhhJlgyDnEiDUUCKyJ4EGg6nwrTafEFO85
	 h4aFdmffpaNpA==
Date: Thu, 12 Mar 2026 14:05:57 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Linus Walleij <linusw@kernel.org>
cc: Rishi Gupta <gupt21@gmail.com>, Benjamin Tissoires <bentiss@kernel.org>, 
    linux-input@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] HID: mcp2221: Add module parameter to enfoce GPIO mode
In-Reply-To: <20260218-hid-mcp2221-gpio-v1-1-a2ba53867354@kernel.org>
Message-ID: <rn4sqs2r-68p0-4q07-4p6q-rn4q79n02sos@xreary.bet>
References: <20260218-hid-mcp2221-gpio-v1-1-a2ba53867354@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33254-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jikos@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xreary.bet:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 29A8A272457
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 18 Feb 2026, Linus Walleij wrote:

> Add a module parameter to MCP2221 to enfor GPIO mode on the
> general purpose pins GP0 thru GP3.
> 
> If I plug a device of this type into my machine, it will use the
> GP0, GP1, GP2 and GP3 pins for IIO voltage readings by default
> if CONFIG_IIO is set.
> 
> However there may be cases where IIO is available but we want to
> use the GP0 thru GP3 lines for GPIO anyway.
> 
> Example use:
> 
> insmode hid-mcp2221.ko gpio_mode_enforce=1
> 
> Result in dmesg:
> mcp2221 0003:04D8:00DD.0005: GPIO 0 not in gpio mode
> mcp2221 0003:04D8:00DD.0005: GPIO 1 not in gpio mode
> mcp2221 0003:04D8:00DD.0005: GPIO 2 not in gpio mode
> mcp2221 0003:04D8:00DD.0005: GPIO 3 not in gpio mode
> mcp2221 0003:04D8:00DD.0005: Set GPIO mode for gpio pin 0!
> mcp2221 0003:04D8:00DD.0005: Set GPIO mode for gpio pin 1!
> mcp2221 0003:04D8:00DD.0005: Set GPIO mode for gpio pin 2!
> mcp2221 0003:04D8:00DD.0005: Set GPIO mode for gpio pin 3!
> 
> After this the gpiolib tools such as gpioset can be used to alter
> the GPIO line values successfully.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Applied to hid.git#for-7.1/mcp2221, thanks.

-- 
Jiri Kosina
SUSE Labs


