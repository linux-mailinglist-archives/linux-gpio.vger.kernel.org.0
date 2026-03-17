Return-Path: <linux-gpio+bounces-33620-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCKEFflAuWmB9QEAu9opvQ
	(envelope-from <linux-gpio+bounces-33620-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 12:54:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9262A94AD
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 12:54:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5E7C93025721
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 11:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4433B19C4;
	Tue, 17 Mar 2026 11:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T8DcSW2L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5D33B0AE0;
	Tue, 17 Mar 2026 11:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748370; cv=none; b=e6cye4yRcI8AllD1M3Y4RtqLAnTUKznvGwbwTCvPCf/0VrzRj1LyLgKLB5ghNa+qYbBzw7Ky64s466wjVN1sBiVVvHwW61ogjXuRpZ3deYoPsH6pHZRRPgTq96beWKOIXJIqzH22dCkvEwWKuixxernvRA5lfx74g+wwuLDvty4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748370; c=relaxed/simple;
	bh=bAcLqt5AOOlimNdDcnW9re6/aAcNUgnFMoUDknv+gPY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Lh2e6BaxPiMW4oAoyGtT6f5KlXIl4ZELJmZemFRKKwiu/2uajUqlB4y8ky2tsISkwxUfU4YBFMnmhL/sg1fRh0SRCBzluhQBlXynX1q52EbPoQ0CNDVLSCLuttTw5H2rtLtf4Tv56CIiPdEK6hG0mU/QPMAbBTH7sc5VnPvKx6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T8DcSW2L; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773748370; x=1805284370;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=bAcLqt5AOOlimNdDcnW9re6/aAcNUgnFMoUDknv+gPY=;
  b=T8DcSW2LZ8+4OKYRXKyfOIbCH9xerOFt8bzckOOijJxxU6dy5WmzuFg/
   7HBcnSDZPg5FxRhN8R5Uz6CfqBmbfGQmX8x2RDmGqxdQAaqECmmCL/LdP
   3mlfa6qAg6Km10zDWREIBA81K+zqQpnG74XAZJjSSwWYGdF4+tPiO2MWi
   pV876WB8InvOrKNrgKH/mZogMlUvCdJBAmORcAYf35s12/+6txKgn098g
   bZUV6SjsfTdNRQCDyjdsSqRf3pdH6vJ5N78cA/qBphNMnt70B6jzgn9BY
   dYIanR1ckMGQYFn+Bpcb5trPyuJzLIHx/aNAl+Og5LzYPdqLuk/Mmibrc
   g==;
X-CSE-ConnectionGUID: C+N+nDH9RqyLHM2hWg5r8w==
X-CSE-MsgGUID: y/A+HXBiSDarhRhI+VMNMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="77386993"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="77386993"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 04:52:44 -0700
X-CSE-ConnectionGUID: aZjilz0bQ324rLoXclnpLg==
X-CSE-MsgGUID: d8qIAcOFTa6Vn+dpHGQtXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226369881"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.161])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 04:52:38 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 17 Mar 2026 13:52:34 +0200 (EET)
To: Antti Laakso <antti.laakso@linux.intel.com>
cc: linux-media@vger.kernel.org, linux-gpio@vger.kernel.org, 
    platform-driver-x86@vger.kernel.org, linusw@kernel.org, brgl@kernel.org, 
    sakari.ailus@linux.intel.com, mchehab@kernel.org, 
    dan.scally@ideasonboard.com, Hans de Goede <hansg@kernel.org>, 
    hverkuil+cisco@kernel.org, sre@kernel.org, hao.yao@intel.com, 
    jimmy.su@intel.com, miguel.vadillo@intel.com, kees@kernel.org, 
    ribalda@chromium.org
Subject: Re: [PATCH v2 5/5] platform: int3472: Add MSI prestige board data
In-Reply-To: <20260311131910.835513-6-antti.laakso@linux.intel.com>
Message-ID: <c6625073-7af9-a0c8-2755-8a47d2abe638@linux.intel.com>
References: <20260311131910.835513-1-antti.laakso@linux.intel.com> <20260311131910.835513-6-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-952343647-1773748354=:968"
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33620-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 1A9262A94AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-952343647-1773748354=:968
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 11 Mar 2026, Antti Laakso wrote:

> Define regulators and gpio for ov5675 in MSI Prestige 14 AI EVO+ laptop.
>=20
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> ---
>  .../x86/intel/int3472/tps68470_board_data.c   | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>=20
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/d=
rivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 71357a036292..6892d6e98072 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -12,6 +12,7 @@
>  #include <linux/dmi.h>
>  #include <linux/gpio/machine.h>
>  #include <linux/platform_data/tps68470.h>
> +#include <linux/property.h>
>  #include <linux/regulator/machine.h>
>  #include "tps68470.h"
> =20
> @@ -232,6 +233,72 @@ static const struct tps68470_regulator_platform_data=
 dell_7212_tps68470_pdata =3D
>  =09},
>  };
> =20
> +/* Settings for MSI Prestige 14 AI+ Evo C2VMG laptop. */
> +static struct regulator_consumer_supply ovti5675_avdd_consumer_supplies[=
] =3D {
> +=09REGULATOR_SUPPLY("avdd", "i2c-OVTI5675:00"),
> +};
> +
> +static struct regulator_consumer_supply ovti5675_dovdd_consumer_supplies=
[] =3D {
> +=09REGULATOR_SUPPLY("dovdd", "i2c-OVTI5675:00"),
> +};
> +
> +static struct regulator_consumer_supply ovti5675_dvdd_consumer_supplies[=
] =3D {
> +=09REGULATOR_SUPPLY("dvdd", "i2c-OVTI5675:00"),
> +};
> +
> +static const struct regulator_init_data msi_p14_ai_evo_tps68470_core_reg=
_init_data =3D {
> +=09.constraints =3D {
> +=09=09.min_uV =3D 1200000,
> +=09=09.max_uV =3D 1200000,
> +=09=09.apply_uV =3D 1,
> +=09=09.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> +=09},
> +=09.num_consumer_supplies =3D ARRAY_SIZE(ovti5675_dvdd_consumer_supplies=
),
> +=09.consumer_supplies =3D ovti5675_dvdd_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data msi_p14_ai_evo_tps68470_ana_reg_=
init_data =3D {
> +=09.constraints =3D {
> +=09=09.min_uV =3D 2815200,
> +=09=09.max_uV =3D 2815200,
> +=09=09.apply_uV =3D 1,
> +=09=09.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> +=09},
> +=09.num_consumer_supplies =3D ARRAY_SIZE(ovti5675_avdd_consumer_supplies=
),
> +=09.consumer_supplies =3D ovti5675_avdd_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data msi_p14_ai_evo_tps68470_vio_reg_=
init_data =3D {
> +=09.constraints =3D {
> +=09=09.min_uV =3D 1800600,
> +=09=09.max_uV =3D 1800600,
> +=09=09.apply_uV =3D 1,
> +=09=09.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> +=09},
> +=09.num_consumer_supplies =3D 0,
> +=09.consumer_supplies =3D NULL,
> +};
> +
> +static const struct regulator_init_data msi_p14_ai_evo_tps68470_vsio_reg=
_init_data =3D {
> +=09.constraints =3D {
> +=09=09.min_uV =3D 1800600,
> +=09=09.max_uV =3D 1800600,
> +=09=09.apply_uV =3D 1,
> +=09=09.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> +=09},
> +=09.num_consumer_supplies =3D ARRAY_SIZE(ovti5675_dovdd_consumer_supplie=
s),
> +=09.consumer_supplies =3D ovti5675_dovdd_consumer_supplies,
> +};
> +
> +static const struct tps68470_regulator_platform_data msi_p14_ai_evo_tps6=
8470_pdata =3D {
> +=09.reg_init_data =3D {
> +=09=09[TPS68470_CORE] =3D &msi_p14_ai_evo_tps68470_core_reg_init_data,
> +=09=09[TPS68470_ANA]  =3D &msi_p14_ai_evo_tps68470_ana_reg_init_data,
> +=09=09[TPS68470_VIO]  =3D &msi_p14_ai_evo_tps68470_vio_reg_init_data,
> +=09=09[TPS68470_VSIO] =3D &msi_p14_ai_evo_tps68470_vsio_reg_init_data,
> +=09},
> +};
> +
>  static struct gpiod_lookup_table surface_go_int347a_gpios =3D {
>  =09.dev_id =3D "i2c-INT347A:00",
>  =09.table =3D {
> @@ -258,6 +325,23 @@ static struct gpiod_lookup_table dell_7212_int3479_g=
pios =3D {
>  =09}
>  };
> =20
> +static struct gpiod_lookup_table msi_p14_ai_evo_ovti5675_gpios =3D {
> +=09.dev_id =3D "i2c-OVTI5675:00",
> +=09.table =3D {
> +=09=09GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
> +=09=09{ }
> +=09}
> +};
> +
> +static const struct property_entry msi_p14_ai_evo_gpio_props[] =3D {
> +=09PROPERTY_ENTRY_BOOL("daisy-chain-enable"),
> +=09{ }
> +};
> +
> +static const struct software_node msi_p14_ai_evo_tps68470_gpio_swnode =
=3D {
> +=09.properties =3D msi_p14_ai_evo_gpio_props,
> +};
> +
>  static const struct int3472_tps68470_board_data surface_go_tps68470_boar=
d_data =3D {
>  =09.dev_name =3D "i2c-INT3472:05",
>  =09.tps68470_regulator_pdata =3D &surface_go_tps68470_pdata,
> @@ -287,6 +371,16 @@ static const struct int3472_tps68470_board_data dell=
_7212_tps68470_board_data =3D
>  =09},
>  };
> =20
> +static const struct int3472_tps68470_board_data msi_p14_ai_evo_tps68470_=
board_data =3D {
> +=09.dev_name =3D "i2c-INT3472:06",
> +=09.tps68470_regulator_pdata =3D &msi_p14_ai_evo_tps68470_pdata,
> +=09.tps68470_gpio_swnode =3D &msi_p14_ai_evo_tps68470_gpio_swnode,
> +=09.n_gpiod_lookups =3D 1,
> +=09.tps68470_gpio_lookup_tables =3D {
> +=09=09&msi_p14_ai_evo_ovti5675_gpios,
> +=09},
> +};
> +
>  static const struct dmi_system_id int3472_tps68470_board_data_table[] =
=3D {
>  =09{
>  =09=09.matches =3D {
> @@ -316,6 +410,13 @@ static const struct dmi_system_id int3472_tps68470_b=
oard_data_table[] =3D {
>  =09=09},
>  =09=09.driver_data =3D (void *)&dell_7212_tps68470_board_data,
>  =09},
> +=09{
> +=09=09.matches =3D {
> +=09=09=09DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., =
Ltd."),
> +=09=09=09DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Prestige 14 AI+ Evo C2VMG"),
> +=09=09},
> +=09=09.driver_data =3D (void *)&msi_p14_ai_evo_tps68470_board_data,
> +=09},
>  =09{ }
>  };
> =20
>=20

Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-952343647-1773748354=:968--

