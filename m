Return-Path: <linux-gpio+bounces-33262-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJ6NF9vcsmmtQQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33262-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 16:33:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8913274912
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 16:33:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAD6630A04E6
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 15:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78293B777C;
	Thu, 12 Mar 2026 15:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b0yekm05"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA92238159;
	Thu, 12 Mar 2026 15:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773329278; cv=none; b=ZigATPugfpefhAzZ0icfyLyvVKFjU3ytRIDxxJpMIKv5WdpuicpVy5ZKYUTZtU4VkECz8GrrSC+1rk9jitN84TpWWylMs74FiTQz4LsbLcBA8pmvsvB6FFTGROJw+v47JdzSFCcP0DO5qI+4dUmJmMHSduCdYhW+w7nK3S90Tw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773329278; c=relaxed/simple;
	bh=8dH/mFWlJvpvVrmPDnbkFrGmjYLDxkA/o3NvlttQmP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyHpnCd8TcNsMM7SpPiRJ9wy6qUQa1daFoKvljMgkoZ4HAYaD2ggQz5ALEN7nF61QDNSROte3CoJ3s7yi259QTka5+qZ7xmKLtiOksuAXszUcA0UFAtVFSdeHeq0GRhdT8Zbj8wCH1l21PcQFZYYHdjGyrteDTtrAF3XFdddCWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b0yekm05; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C860C19424;
	Thu, 12 Mar 2026 15:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773329278;
	bh=8dH/mFWlJvpvVrmPDnbkFrGmjYLDxkA/o3NvlttQmP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b0yekm05/4C9bNOwUlQbKDgQqBpOah2g59yUoFZwI/leF/mcoIQkimPlZ8piIF8E0
	 E4iqjj8XNW6nunYqGx/NYJUvEKgeKCB5zc7DwWcs3mgdzwA5muq2TZjpFy7wopU05e
	 1jJVRPvKPQa23K6RnYDbJoPXXBiZrb2t5J2YJxznYeOZvVwAz70EJ1BgFO2Z3tie8j
	 1mKIO/Y0oNvakrMCm3zn+Y/gXNWMVOePI65RmDuPO1ZpPs12ETJI5JFY0n7lEQ6dpn
	 RaaTbvkq4uRX6bYP27xuyDXpjRcVQXHupx1QbxGvjBL5ASQ091u3rorPejXhNwMrCd
	 7yD/rTEd88KNQ==
Date: Thu, 12 Mar 2026 15:27:54 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/7] pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
Message-ID: <20260312-pastoral-peacock-of-essence-d21feb@sudeepholla>
References: <cover.1773150895.git.dan.carpenter@linaro.org>
 <ce2b6b8f5b5432ac551720bad5776ef2ce490b68.1773150895.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce2b6b8f5b5432ac551720bad5776ef2ce490b68.1773150895.git.dan.carpenter@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-33262-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,arm.com,vger.kernel.org,lists.infradead.org,intel.com,oss.qualcomm.com];
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
X-Rspamd-Queue-Id: E8913274912
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 10:38:16PM +0300, Dan Carpenter wrote:
> The PIN_CONFIG_LEVEL parameter represents the value of the pin, whether
> reading or writing to the pin.  In SCMI, the parameter is represented by
> two different values SCMI_PIN_OUTPUT_VALUE for writing to a pin and
> SCMI_PIN_INPUT_VALUE for reading.  The current code translates
> PIN_CONFIG_LEVEL as SCMI_PIN_OUTPUT_VALUE (writing).
> 
> Add a function to translate it to either INPUT or OUTPUT depending on
> whether it is called from a _get or _set() operation.
> 

Acked-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

