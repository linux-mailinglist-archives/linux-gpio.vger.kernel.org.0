Return-Path: <linux-gpio+bounces-31238-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBFhHsgNemmS2AEAu9opvQ
	(envelope-from <linux-gpio+bounces-31238-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 14:23:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBB1A2114
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 14:23:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B5D83003D3C
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 13:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34157352C48;
	Wed, 28 Jan 2026 13:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PeQIO3U2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7878274FFD;
	Wed, 28 Jan 2026 13:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606598; cv=none; b=Bxig7iKKrCQUIF5swafGGP6btliaIJWNtQ5Han8sfcZFbB5x64nXnv3qNSo7/0PpoVDpnYlSQr83sMi0diO+g+es0fBn+Z1Q3mp0Sr34NhHxUrkwxI6BtBIEXrIYVv8TBKIzgfgEvmvGSb3UqS08+SuaCjIrXWU+yCuYjXpOTys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606598; c=relaxed/simple;
	bh=IeIgHCnoKrrwDLa4ZG0p7SNUSOu5AnshFpJoJd+Ug8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpzKLsxsQD/w1QCPBaHvqKNNYBnKjTbm2hiOBnDPfBBzqDlRO7MNlgTjkFbLR1K3S5A4umekvEZWNMcm1XtRF7bLD6ElWsVxtJsW4HZfR6B3RvYXqbozCbJ+nV8kk8JLmekpqBQ1IBiewRPPLdKLdDWBhqpGo4UHkXf5ej9IJ7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PeQIO3U2; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769606597; x=1801142597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IeIgHCnoKrrwDLa4ZG0p7SNUSOu5AnshFpJoJd+Ug8w=;
  b=PeQIO3U2fzcSwSzYYZnjmPRejqCymaRJ0wqt2CzSD5eQxeLncu+LHidy
   UEn9lCvUKIXxxxuPON2r6Gq8ZMlaS90keez5ClVpCDAD3gyWJnNDKnnVz
   fRDfEsGCmn/Apy3wOHxSKWAJff+OE29HzJj+yFHQLHz1WGep8CspZEPA4
   1DWeEc9Bz8a6FkDMJs8nB38y+iEA+DxqOkcMYtJup6dmD4eiAW9z0ga1p
   fIlg8G2OQk7afe2BjiXeSsX5uH/+KmTpGtcB5uqLbJg8iDZqwbmFu3jHC
   wd+ONNFuigLeyjmPbYOdk234Hvjr63NDhSHsnSoXst+U1oZbpDBF7AdZI
   A==;
X-CSE-ConnectionGUID: KCPWH60/SPOrqZ3Yl4Dnlg==
X-CSE-MsgGUID: kXdKjingTaWaZ6JGNhZTww==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70788988"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70788988"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:23:17 -0800
X-CSE-ConnectionGUID: q0hJTQ9kSAi2p8OVGs2M5g==
X-CSE-MsgGUID: MUI5cSzuTqqafDugQr1gbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208706855"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 28 Jan 2026 05:23:15 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 56FB698; Wed, 28 Jan 2026 14:23:14 +0100 (CET)
Date: Wed, 28 Jan 2026 14:23:14 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Remove duplicate error messages
Message-ID: <20260128132314.GR2275908@black.igk.intel.com>
References: <20260128130925.123823-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260128130925.123823-1-andriy.shevchenko@linux.intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31238-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: 0DBB1A2114
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 02:09:25PM +0100, Andy Shevchenko wrote:
> The pin control core is covered to report any error via message.
> Since that it's not needed in the callers.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

