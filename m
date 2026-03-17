Return-Path: <linux-gpio+bounces-33621-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNlwC8JAuWmB9QEAu9opvQ
	(envelope-from <linux-gpio+bounces-33621-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 12:53:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9A82A946F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 12:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C336302A9CA
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 11:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09AA63B47ED;
	Tue, 17 Mar 2026 11:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BvsSJsms"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B9C3B19C7;
	Tue, 17 Mar 2026 11:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748415; cv=none; b=g10iuzXHRk0t9N8xlCthJ3lXMcx8q5dJtTCaw6Zs5KgKdpIJ2xCzccvQK6HIU/9oNEZh3iPBaE76DkaNSXN39+2ix8ibB0Pc8Dtf+jaViXMTvGDd+A7XSskebi8lUfb4opAzY3cUv1yf7hszxN25GpUzinzHpMPz++3fUoYCaBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748415; c=relaxed/simple;
	bh=2coD4p4KovcXn8BoPAlhdlEa2lyIGla7OywK1ZJnOt0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Qg95hILV7olt0xNjKyFo8AoojejigtTwRwT60Ak4RxiNoPeFaiBbkvP2yPcKW4Y/jn6LKQwWqcKfLzWAw7bfkQ6K4/aoPlO8mBbkOg5Fj3aRfRS8cu8cDeMkWeEQb6yADxh93MTA1XS4oXwNiui0CfoRGc424QxESQCJ/N2AeYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BvsSJsms; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773748415; x=1805284415;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2coD4p4KovcXn8BoPAlhdlEa2lyIGla7OywK1ZJnOt0=;
  b=BvsSJsmszO2l9CQIYx4nUZLiqiWzm+v3r8Qqg925iNRiyIxO1ZgG++2P
   GexaGnedt7rOKEq7LCp4JLpJSEFFobzUUNzriW/pwe4302AzTroB3waXt
   ZG/kvF0A7GYzy4GPjSzejeWRXxmtm1PmnDRcV3Rhp3Qtc5znBCysu99Ze
   752S/g4zcwgjBOSR/94yBeb1cTPvtiBQpgKKAbS4jiynnB8V0vkk02Nha
   AbSGjFtuxLGFojl6bbLkTi8CaM8GmSkpxtgQiT8ii/IXM9cJLctQoQlaX
   o9XQRVGCh5myZ0IwM3YHYb1bPAd6gd/Ddf9oEC2gy3e9Yn9M+q/RQgS8w
   w==;
X-CSE-ConnectionGUID: BaEiUXr5TCepkCogFUm7qg==
X-CSE-MsgGUID: MUTHGDfaSlS8vzKYwk1O2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74894677"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74894677"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 04:53:31 -0700
X-CSE-ConnectionGUID: +sNvFnjuQDmmeJJBEKQVNw==
X-CSE-MsgGUID: +jPE4JZnTY+tvXVaRJF8SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="227218622"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.161])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 04:53:26 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 17 Mar 2026 13:53:22 +0200 (EET)
To: Antti Laakso <antti.laakso@linux.intel.com>
cc: linux-media@vger.kernel.org, linux-gpio@vger.kernel.org, 
    platform-driver-x86@vger.kernel.org, linusw@kernel.org, brgl@kernel.org, 
    sakari.ailus@linux.intel.com, mchehab@kernel.org, 
    dan.scally@ideasonboard.com, Hans de Goede <hansg@kernel.org>, 
    hverkuil+cisco@kernel.org, sre@kernel.org, hao.yao@intel.com, 
    jimmy.su@intel.com, miguel.vadillo@intel.com, kees@kernel.org, 
    ribalda@chromium.org
Subject: Re: [PATCH v2 3/5] platform: int3472: Add gpio software node
In-Reply-To: <20260311131910.835513-4-antti.laakso@linux.intel.com>
Message-ID: <a4d0f176-7bd7-ae9f-a60d-0218553ae9a0@linux.intel.com>
References: <20260311131910.835513-1-antti.laakso@linux.intel.com> <20260311131910.835513-4-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1862358510-1773748402=:968"
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33621-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+,1:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,ideasonboard.com:email]
X-Rspamd-Queue-Id: DE9A82A946F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1862358510-1773748402=:968
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 11 Mar 2026, Antti Laakso wrote:

> The tps68470 supports i2c daisy chain, which need to be configured by
> gpio-tps68470 driver. Add daisy chain information to software node.
>=20
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  drivers/platform/x86/intel/int3472/tps68470.c | 1 +
>  drivers/platform/x86/intel/int3472/tps68470.h | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/plat=
form/x86/intel/int3472/tps68470.c
> index a496075c0d2a..a77ed32abe55 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -197,6 +197,7 @@ static int skl_int3472_tps68470_probe(struct i2c_clie=
nt *client)
>  =09=09cells[1].platform_data =3D (void *)board_data->tps68470_regulator_=
pdata;
>  =09=09cells[1].pdata_size =3D sizeof(struct tps68470_regulator_platform_=
data);
>  =09=09cells[2].name =3D "tps68470-gpio";
> +=09=09cells[2].swnode =3D board_data->tps68470_gpio_swnode;
> =20
>  =09=09for (i =3D 0; i < board_data->n_gpiod_lookups; i++)
>  =09=09=09gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[=
i]);
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/plat=
form/x86/intel/int3472/tps68470.h
> index 35915e701593..3bbaade96c57 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.h
> +++ b/drivers/platform/x86/intel/int3472/tps68470.h
> @@ -17,6 +17,7 @@ struct tps68470_regulator_platform_data;
>  struct int3472_tps68470_board_data {
>  =09const char *dev_name;
>  =09const struct tps68470_regulator_platform_data *tps68470_regulator_pda=
ta;
> +=09const struct software_node *tps68470_gpio_swnode;
>  =09unsigned int n_gpiod_lookups;
>  =09struct gpiod_lookup_table *tps68470_gpio_lookup_tables[];
>  };
>=20

Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1862358510-1773748402=:968--

