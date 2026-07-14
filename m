Return-Path: <linux-gpio+bounces-40030-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xma7AtjkVWqruwAAu9opvQ
	(envelope-from <linux-gpio+bounces-40030-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:27:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B568E751D6A
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:27:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=paPKPCN3;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40030-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40030-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3232F3027340
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 07:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BABB3F8707;
	Tue, 14 Jul 2026 07:25:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D1F3F7A87
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 07:25:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013947; cv=none; b=Yql3p/kjcT6Z9sr0yQbs2Bj5Ba60xSkcNG4wzLocLLv4FMz+KzOpU1hZKQCME/rdw2AlwWEo6u/ToSs4jnvSnU4cyrZKWfMSNyRVhDjiPim7a8xzvAje2YOMJL+UpY217mDFGkUbvo+OjBagVfrxmigdvjl2BzQJOMOfOa6qyoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013947; c=relaxed/simple;
	bh=nTdOcoK/nWyW/rkofbp0w0DGb/LYPCTlxZOuQMt5Oao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BOqbqmosoBFQp7Pq+wKlCfRRm0Ifj8KfMVQSmm4p6nb/fwAVctpcHwuKh6Ut//UE3jIcu7VYY/X+nIl2a8tcjYFF9Y8EP8//k2mBucd9VKpVDMZpTCKwxNdn/QWbAsf53VQNmOodClKgapRVScGZoDHs5ruZ8lNmFv9hqTBUgEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=paPKPCN3; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493e8d4f4dcso30809295e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 00:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784013941; x=1784618741; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mgdjt565OXZhAriQ2MT8qRHkh1kb+LM8RQGkUtmtsS4=;
        b=paPKPCN3Orb64XvLKuGyrOhjVAl2WDIvfAd7DWwY0I28Tv+PJ6PKVl5DbbdsXi+9bl
         /XKIe9K56qrWLqJPPbg+DqYK+O11fwuWyP1AkuZzAkPB/mnpB390wfhI8N4MruIPRy0n
         b5jBXAcpUlztzqGBNsUKnqlWijduDWMyZ82Z0xde2Z7BJpIBBSzdXzGc5yc3CdIDID39
         TUcoc1aT3XyJSFh6mO0Sy1Q9iuhhArUgX97tAjJZvDdCVCFOo1HAlUpIVXaQNEU6Db7d
         pHHLG9Yy7kO21/hN/lNfU/fdgg12J6K87s2u+6+LjgdsmDS9KwRtsNj6B/uxu7Emt0aN
         gWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013941; x=1784618741;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mgdjt565OXZhAriQ2MT8qRHkh1kb+LM8RQGkUtmtsS4=;
        b=cQLANKBkmAqpmZ3d5QP4WPjac8rZHkbYa1L0WSkCFuN921xORnneGrVUHVN2r95+qm
         w8Zd+JFsfJ8s3DZdJE5hfntzHPQOQffVQTEqKQfiwv563QS8ZdOdBP1A0KGr2cMtSLUt
         5e6ic0uJHmqlf9TQ7yndGaVgZbOeVDoOVI++MJxS5XdYkJoZp1ZYNqA7Kb8JJrryt+nz
         pmTYKH+4WnGQ6YDPji+tJbSrbh3ZrNTsn2GnL1qlTPR48soppim9MjdqxTJ6HQSqMjlA
         6/0z50Mz4+SiL3QLCutTZrtoKDPhvmADUUQAPTGtXZOLdHg5vVXcv4XahpG8SiGDfzhZ
         EAMA==
X-Forwarded-Encrypted: i=1; AHgh+RrU4C4Be7kiB6eCvWobWuD/JUgoYG3KIgOp5rxT+DZ/NS9QfBeuPRsfzWcBqvp82jM5I1i1SFD0xCY3@vger.kernel.org
X-Gm-Message-State: AOJu0YzhipBgcJPz1Jc9Vu66bFUw/mokLAzQ8OKzRx0jj4zEdkkmtqmc
	oQftV+1j+dmDXYQSt3zuouptiynwOhLq+Ju7Sn9INLDo24ssut/DxOehLJWUipr8CjU=
X-Gm-Gg: AfdE7cnkEoUY0wcCzAOxIlTktGEfna8YLrjEUUABk+UIuniaLZIBa8U//kSXvTppbSD
	8+hw2Q23BV5DBkorkIOLPLod7g6Jtb7fyLQey4oTDbnXY96BlO17w4ROQbfDseEIHmm2dOST8cZ
	OfYjpRvxjHqt5vxehewFqgocIkAqzemg1LU3eOs2hr4d4At3Q+tewlSu/ex2L2lFlX+TbNNk7Sa
	0cOCHoOXgoJXBiC4NN/yI7YOGRTvQnouvh2mOq0vVgECXsKACjlKjNXbTQV+rWln5TdeFWy04m+
	Gkxd4wV4GtXlenWhuG9JU/qKkhSefhg/m/WeG8oB9UyxRbRrEuWx7J5XiULeMdrswCqC29IRX2N
	Jlp5+CnmNTCOVWmXYTFnKpuYcIaJRlNXSr0wxtuMIses8ncWgu3utof9PvnjBKgNLRwvrUZN23e
	+mm8Gml8S5jQ7ZhmgsVEpozvyFEqcdErOOk5CjKXaGC14aD8JM08OfLo3byytuJAiHQHgPeGHbn
	sIH
X-Received: by 2002:a05:600c:a42:b0:493:c77c:108a with SMTP id 5b1f17b1804b1-493f883c8ffmr128451425e9.36.1784013940652;
        Tue, 14 Jul 2026 00:25:40 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4950a32b9f3sm63335725e9.13.2026.07.14.00.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:25:40 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Adrian Ng <adrianhoyin.ng@altera.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Alban Bedel <albeu@free.fr>,
	James Cowgill <james.cowgill@blaize.com>,
	Matt Redfearn <matt.redfearn@blaize.com>,
	Neil Jones <neil.jones@blaize.com>,
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Keerthy <j-keerthy@ti.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Yang Shen <shenyang39@huawei.com>,
	Imre Kaloz <kaloz@openwrt.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	=?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	Bamvor Jian Zhang <bamv2005@gmail.com>,
	=?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Michael Walle <mwalle@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	asahi@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	imx@lists.linux.dev,
	openbmc@lists.ozlabs.org,
	linux-omap@vger.kernel.org,
	linux-unisoc@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v1 16/20] gpio: Unify style of of_device_id arrays
Date: Tue, 14 Jul 2026 09:24:17 +0200
Message-ID:  <e7204bb628aee723fdcd241e55d87799cc03fce1.1784013063.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=41700; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=nTdOcoK/nWyW/rkofbp0w0DGb/LYPCTlxZOuQMt5Oao=; b=owGbwMvMwMXY3/A7olbonx/jabUkhqzQJy47vYKS2yxNuvQOsqbF3nz4do3I3MalTz0iFgR0f hHObq7qZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAiR35wMOxa/EjeZWZu38JZ j41CjcMj2ysNCmqPfl4v7sSbVKVQnifHM/ftJeemu3KxDvYx61anqeVvczL7+/roy8YDs+vaOh7 27RTPebqxI553fWHBMqnI1vcMeX7qARk3K4y+2Bcc3+vMJXXv3MSEKh6P+A99jGIFK04a3OJhZu Y5Wh+uqv4jtn9/4nejo0oXt/vzuLzzP29Tump13h17+YchK/4mmPREckbnqLw/GuxnG2RyOCXxk KTKt8csOyyd/aaFSN/XzS/tWZjQnn7NxzpaaWfOmUM1k+dMvXyw4+C5TQ1vNZW+NetwL+BcEGv5 ymzSeo5HMiGfC+6tYQvXOjMndy2D6EW9Bfk8W7Ywrm8DAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-40030-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:geert+renesas@glider.be,m:adrianhoyin.ng@altera.com,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:albeu@free.fr,m:james.cowgill@blaize.com,m:matt.redfearn@blaize.com,m:neil.jones@blaize.com,m:nikolaos.pasaloukos@blaize.com,m:opendmb@gmail.com,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:Eugeniy.Paltsev@synopsys.com,m:j-keerthy@ti.com,m:hoan@os.amperecomputing.com,m:shenyang39@huawei.com,m:kaloz@openwrt.org,m:zhuyinbo@loongson.cn,m:vz@mleia.com,m:piotr.wojtaszczyk@timesys.com,m:sven@kernel.org,m:j@jannau.net,m:neal@gompa.dev,m:mathieu.dubois-briand@bootlin.com,m:andre.draszik@linaro.org,m:bamv2005@gmail.com,m:kabel@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m
 :benjaminfair@google.com,m:grygorii.strashko@ti.com,m:ssantosh@kernel.org,m:khilman@kernel.org,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:robert.jarzmik@free.fr,m:mani@kernel.org,m:heiko@sntech.de,m:ludovic.desroches@microchip.com,m:pjw@kernel.org,m:samuel.holland@sifive.com,m:mwalle@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:shubhrajyoti.datta@amd.com,m:srinivas.neeli@amd.com,m:michal.simek@amd.com,m:magnus.damm@gmail.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:asahi@lists.linux.dev,m:linux-mediatek@lists.infradead.org,m:imx@lists.linux.dev,m:openbmc@lists.ozlabs.org,m:linux-omap@vger.kernel.org,m:linux-unisoc@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-riscv@lists.infradead.o
 rg,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-tegra@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[glider.be,altera.com,jms.id.au,codeconstruct.com.au,free.fr,blaize.com,gmail.com,broadcom.com,synopsys.com,ti.com,os.amperecomputing.com,huawei.com,openwrt.org,loongson.cn,mleia.com,timesys.com,kernel.org,jannau.net,gompa.dev,bootlin.com,linaro.org,collabora.com,nxp.com,pengutronix.de,google.com,linux.alibaba.com,sntech.de,microchip.com,sifive.com,foss.st.com,nvidia.com,mail.toshiba,amd.com,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.linux.dev,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCPT_COUNT_GT_50(0.00)[80];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,baylibre.com:from_mime,baylibre.com:mid,baylibre.com:email,baylibre.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B568E751D6A

Update the various of_device_id arrays to conform to the most used and
generally recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the few offenders accordingly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-74x164.c         |  2 +-
 drivers/gpio/gpio-adnp.c           |  4 ++--
 drivers/gpio/gpio-aggregator.c     |  2 +-
 drivers/gpio/gpio-altera-a10sr.c   |  2 +-
 drivers/gpio/gpio-altera.c         |  4 ++--
 drivers/gpio/gpio-aspeed-sgpio.c   | 10 +++++-----
 drivers/gpio/gpio-aspeed.c         | 10 +++++-----
 drivers/gpio/gpio-ath79.c          |  2 +-
 drivers/gpio/gpio-blzp1600.c       |  2 +-
 drivers/gpio/gpio-brcmstb.c        |  2 +-
 drivers/gpio/gpio-cadence.c        |  4 ++--
 drivers/gpio/gpio-creg-snps.c      |  4 ++--
 drivers/gpio/gpio-davinci.c        |  6 +++---
 drivers/gpio/gpio-dwapb.c          |  4 ++--
 drivers/gpio/gpio-em.c             |  4 ++--
 drivers/gpio/gpio-ftgpio010.c      |  2 +-
 drivers/gpio/gpio-grgpio.c         |  2 +-
 drivers/gpio/gpio-gw-pld.c         |  4 ++--
 drivers/gpio/gpio-hisi.c           |  2 +-
 drivers/gpio/gpio-hlwd.c           |  4 ++--
 drivers/gpio/gpio-ixp4xx.c         |  2 +-
 drivers/gpio/gpio-loongson-64bit.c |  2 +-
 drivers/gpio/gpio-lp3943.c         |  2 +-
 drivers/gpio/gpio-lpc32xx.c        |  4 ++--
 drivers/gpio/gpio-macsmc.c         |  4 ++--
 drivers/gpio/gpio-max7360.c        |  8 ++++----
 drivers/gpio/gpio-max77759.c       |  2 +-
 drivers/gpio/gpio-mm-lantiq.c      |  2 +-
 drivers/gpio/gpio-mockup.c         |  4 ++--
 drivers/gpio/gpio-moxtet.c         |  4 ++--
 drivers/gpio/gpio-mpc5200.c        |  4 ++--
 drivers/gpio/gpio-mpc8xxx.c        | 22 +++++++++++-----------
 drivers/gpio/gpio-mt7621.c         |  2 +-
 drivers/gpio/gpio-mxc.c            |  2 +-
 drivers/gpio/gpio-mxs.c            |  4 ++--
 drivers/gpio/gpio-nomadik.c        |  6 +++---
 drivers/gpio/gpio-npcm-sgpio.c     |  6 +++---
 drivers/gpio/gpio-octeon.c         |  2 +-
 drivers/gpio/gpio-omap.c           |  2 +-
 drivers/gpio/gpio-palmas.c         | 10 +++++-----
 drivers/gpio/gpio-pca9570.c        |  2 +-
 drivers/gpio/gpio-pisosr.c         |  2 +-
 drivers/gpio/gpio-pmic-eic-sprd.c  |  2 +-
 drivers/gpio/gpio-pxa.c            | 18 +++++++++---------
 drivers/gpio/gpio-qixis-fpga.c     |  3 +--
 drivers/gpio/gpio-rda.c            |  2 +-
 drivers/gpio/gpio-realtek-otto.c   |  2 +-
 drivers/gpio/gpio-rockchip.c       |  4 ++--
 drivers/gpio/gpio-sama5d2-piobu.c  |  2 +-
 drivers/gpio/gpio-sifive.c         |  2 +-
 drivers/gpio/gpio-sl28cpld.c       |  2 +-
 drivers/gpio/gpio-spear-spics.c    |  2 +-
 drivers/gpio/gpio-sprd.c           |  2 +-
 drivers/gpio/gpio-stmpe.c          |  2 +-
 drivers/gpio/gpio-stp-xway.c       |  2 +-
 drivers/gpio/gpio-tegra.c          |  2 +-
 drivers/gpio/gpio-tps65218.c       |  2 +-
 drivers/gpio/gpio-ts4800.c         |  4 ++--
 drivers/gpio/gpio-twl4030.c        |  4 ++--
 drivers/gpio/gpio-vf610.c          |  4 ++--
 drivers/gpio/gpio-visconti.c       |  2 +-
 drivers/gpio/gpio-waveshare-dsi.c  |  2 +-
 drivers/gpio/gpio-xgene-sb.c       |  2 +-
 drivers/gpio/gpio-xgene.c          |  4 ++--
 drivers/gpio/gpio-xgs-iproc.c      |  2 +-
 drivers/gpio/gpio-xilinx.c         |  2 +-
 drivers/gpio/gpio-xra1403.c        |  2 +-
 drivers/gpio/gpio-zevio.c          |  4 ++--
 drivers/gpio/gpio-zynqmp-modepin.c |  2 +-
 69 files changed, 128 insertions(+), 129 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 5ca61cf5206a..eeed612e7c80 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -189,7 +189,7 @@ MODULE_DEVICE_TABLE(spi, gen_74x164_spi_ids);
 static const struct of_device_id gen_74x164_dt_ids[] = {
 	{ .compatible = "fairchild,74hc595" },
 	{ .compatible = "nxp,74lvc594" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, gen_74x164_dt_ids);
 
diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index 0410e3adbf54..4b5825a49a08 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -506,8 +506,8 @@ static const struct i2c_device_id adnp_i2c_id[] = {
 MODULE_DEVICE_TABLE(i2c, adnp_i2c_id);
 
 static const struct of_device_id adnp_of_match[] = {
-	{ .compatible = "ad,gpio-adnp", },
-	{ },
+	{ .compatible = "ad,gpio-adnp" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, adnp_of_match);
 
diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 5ce89f52b4b5..872ef6de9c70 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -1651,7 +1651,7 @@ static const struct of_device_id gpio_aggregator_dt_ids[] = {
 	 * Add GPIO-operated devices controlled from userspace below,
 	 * or use "driver_override" in sysfs.
 	 */
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, gpio_aggregator_dt_ids);
 
diff --git a/drivers/gpio/gpio-altera-a10sr.c b/drivers/gpio/gpio-altera-a10sr.c
index a41e5575ee37..2b06315abe74 100644
--- a/drivers/gpio/gpio-altera-a10sr.c
+++ b/drivers/gpio/gpio-altera-a10sr.c
@@ -96,7 +96,7 @@ static int altr_a10sr_gpio_probe(struct platform_device *pdev)
 
 static const struct of_device_id altr_a10sr_gpio_of_match[] = {
 	{ .compatible = "altr,a10sr-gpio" },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, altr_a10sr_gpio_of_match);
 
diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 532e3360b70e..f48b8012ee2b 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -257,8 +257,8 @@ static int altera_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id altera_gpio_of_match[] = {
-	{ .compatible = "altr,pio-1.0", },
-	{},
+	{ .compatible = "altr,pio-1.0" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, altera_gpio_of_match);
 
diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 4225261f61c8..fbde74be8a80 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -594,11 +594,11 @@ static const struct aspeed_sgpio_pdata ast2700_sgpiom_pdata = {
 };
 
 static const struct of_device_id aspeed_sgpio_of_table[] = {
-	{ .compatible = "aspeed,ast2400-sgpio", .data = &ast2400_sgpio_pdata, },
-	{ .compatible = "aspeed,ast2500-sgpio", .data = &ast2400_sgpio_pdata, },
-	{ .compatible = "aspeed,ast2600-sgpiom", .data = &ast2600_sgpiom_pdata, },
-	{ .compatible = "aspeed,ast2700-sgpiom", .data = &ast2700_sgpiom_pdata, },
-	{}
+	{ .compatible = "aspeed,ast2400-sgpio", .data = &ast2400_sgpio_pdata },
+	{ .compatible = "aspeed,ast2500-sgpio", .data = &ast2400_sgpio_pdata },
+	{ .compatible = "aspeed,ast2600-sgpiom", .data = &ast2600_sgpiom_pdata },
+	{ .compatible = "aspeed,ast2700-sgpiom", .data = &ast2700_sgpiom_pdata },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(of, aspeed_sgpio_of_table);
diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index dc53b2decb66..1a7fc65d6279 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1292,11 +1292,11 @@ static const struct aspeed_gpio_config ast2700_config =
 	};
 
 static const struct of_device_id aspeed_gpio_of_table[] = {
-	{ .compatible = "aspeed,ast2400-gpio", .data = &ast2400_config, },
-	{ .compatible = "aspeed,ast2500-gpio", .data = &ast2500_config, },
-	{ .compatible = "aspeed,ast2600-gpio", .data = &ast2600_config, },
-	{ .compatible = "aspeed,ast2700-gpio", .data = &ast2700_config, },
-	{}
+	{ .compatible = "aspeed,ast2400-gpio", .data = &ast2400_config },
+	{ .compatible = "aspeed,ast2500-gpio", .data = &ast2500_config },
+	{ .compatible = "aspeed,ast2600-gpio", .data = &ast2600_config },
+	{ .compatible = "aspeed,ast2700-gpio", .data = &ast2700_config },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
 
diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index aa37579c9608..5270f9121749 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -210,7 +210,7 @@ static void ath79_gpio_irq_handler(struct irq_desc *desc)
 static const struct of_device_id ath79_gpio_of_match[] = {
 	{ .compatible = "qca,ar7100-gpio" },
 	{ .compatible = "qca,ar9340-gpio" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, ath79_gpio_of_match);
 
diff --git a/drivers/gpio/gpio-blzp1600.c b/drivers/gpio/gpio-blzp1600.c
index 0f8c826ba876..ddb50f02224f 100644
--- a/drivers/gpio/gpio-blzp1600.c
+++ b/drivers/gpio/gpio-blzp1600.c
@@ -270,7 +270,7 @@ static int blzp1600_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id blzp1600_gpio_of_match[] = {
-	{ .compatible = "blaize,blzp1600-gpio", },
+	{ .compatible = "blaize,blzp1600-gpio" },
 	{ /* Sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, blzp1600_gpio_of_match);
diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 44ca798cf832..60dec669ca67 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -787,7 +787,7 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
 
 static const struct of_device_id brcmstb_gpio_of_match[] = {
 	{ .compatible = "brcm,brcmstb-gpio" },
-	{},
+	{ }
 };
 
 MODULE_DEVICE_TABLE(of, brcmstb_gpio_of_match);
diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
index d7790fc35c22..1f275af8ecdb 100644
--- a/drivers/gpio/gpio-cadence.c
+++ b/drivers/gpio/gpio-cadence.c
@@ -170,11 +170,11 @@ static const struct irq_chip cdns_gpio_irqchip = {
 static const struct of_device_id cdns_of_ids[] = {
 	{
 		.compatible = "axiado,ax3000-gpio",
-		.data = &ax3000_gpio_quirks
+		.data = &ax3000_gpio_quirks,
 	},
 	{
 		.compatible = "cdns,gpio-r1p02",
-		.data = &cdns_default_quirks
+		.data = &cdns_default_quirks,
 	},
 	{ /* sentinel */ },
 };
diff --git a/drivers/gpio/gpio-creg-snps.c b/drivers/gpio/gpio-creg-snps.c
index 2e159ea41791..6834191d9294 100644
--- a/drivers/gpio/gpio-creg-snps.c
+++ b/drivers/gpio/gpio-creg-snps.c
@@ -125,10 +125,10 @@ static const struct creg_layout axs10x_flsh_cs_ctl = {
 static const struct of_device_id creg_gpio_ids[] = {
 	{
 		.compatible = "snps,creg-gpio-axs10x",
-		.data = &axs10x_flsh_cs_ctl
+		.data = &axs10x_flsh_cs_ctl,
 	}, {
 		.compatible = "snps,creg-gpio-hsdk",
-		.data = &hsdk_cs_ctl
+		.data = &hsdk_cs_ctl,
 	}, { /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, creg_gpio_ids);
diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 270cd7c88812..b7429d778856 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -668,9 +668,9 @@ static DEFINE_SIMPLE_DEV_PM_OPS(davinci_gpio_dev_pm_ops, davinci_gpio_suspend,
 			 davinci_gpio_resume);
 
 static const struct of_device_id davinci_gpio_ids[] = {
-	{ .compatible = "ti,keystone-gpio", keystone_gpio_get_irq_chip},
-	{ .compatible = "ti,am654-gpio", keystone_gpio_get_irq_chip},
-	{ .compatible = "ti,dm6441-gpio", davinci_gpio_get_irq_chip},
+	{ .compatible = "ti,keystone-gpio", .data = keystone_gpio_get_irq_chip },
+	{ .compatible = "ti,am654-gpio", .data = keystone_gpio_get_irq_chip },
+	{ .compatible = "ti,dm6441-gpio", .data = davinci_gpio_get_irq_chip },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, davinci_gpio_ids);
diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index e159c3f98f1c..a5ecb73d8b31 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -713,8 +713,8 @@ static int dwapb_get_clks(struct dwapb_gpio *gpio)
 }
 
 static const struct of_device_id dwapb_of_match[] = {
-	{ .compatible = "snps,dw-apb-gpio", .data = (void *)GPIO_REG_OFFSET_V1},
-	{ .compatible = "apm,xgene-gpio-v2", .data = (void *)GPIO_REG_OFFSET_V2},
+	{ .compatible = "snps,dw-apb-gpio", .data = (void *)GPIO_REG_OFFSET_V1 },
+	{ .compatible = "apm,xgene-gpio-v2", .data = (void *)GPIO_REG_OFFSET_V2 },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dwapb_of_match);
diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index a214b0672726..b660a0c7cfc8 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -357,8 +357,8 @@ static int em_gio_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id em_gio_dt_ids[] = {
-	{ .compatible = "renesas,em-gio", },
-	{},
+	{ .compatible = "renesas,em-gio" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, em_gio_dt_ids);
 
diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
index e29df8d5e571..da30e3d927b9 100644
--- a/drivers/gpio/gpio-ftgpio010.c
+++ b/drivers/gpio/gpio-ftgpio010.c
@@ -321,7 +321,7 @@ static const struct of_device_id ftgpio_gpio_of_match[] = {
 	{
 		.compatible = "faraday,ftgpio010",
 	},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, ftgpio_gpio_of_match);
 
diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index e4fa84e22726..fbbe201cce4c 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -444,7 +444,7 @@ static int grgpio_probe(struct platform_device *ofdev)
 static const struct of_device_id grgpio_match[] = {
 	{.name = "GAISLER_GPIO"},
 	{.name = "01_01a"},
-	{},
+	{ }
 };
 
 MODULE_DEVICE_TABLE(of, grgpio_match);
diff --git a/drivers/gpio/gpio-gw-pld.c b/drivers/gpio/gpio-gw-pld.c
index bf1f91c3c4a8..96a7e11ff667 100644
--- a/drivers/gpio/gpio-gw-pld.c
+++ b/drivers/gpio/gpio-gw-pld.c
@@ -115,8 +115,8 @@ static const struct i2c_device_id gw_pld_id[] = {
 MODULE_DEVICE_TABLE(i2c, gw_pld_id);
 
 static const struct of_device_id gw_pld_dt_ids[] = {
-	{ .compatible = "gateworks,pld-gpio", },
-	{ },
+	{ .compatible = "gateworks,pld-gpio" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, gw_pld_dt_ids);
 
diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
index f03df71e3296..b75b52607711 100644
--- a/drivers/gpio/gpio-hisi.c
+++ b/drivers/gpio/gpio-hisi.c
@@ -228,7 +228,7 @@ static const struct acpi_device_id hisi_gpio_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, hisi_gpio_acpi_match);
 
 static const struct of_device_id hisi_gpio_dts_match[] = {
-	{ .compatible = "hisilicon,ascend910-gpio", },
+	{ .compatible = "hisilicon,ascend910-gpio" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, hisi_gpio_dts_match);
diff --git a/drivers/gpio/gpio-hlwd.c b/drivers/gpio/gpio-hlwd.c
index 043ce5ef3b07..663a8d05719a 100644
--- a/drivers/gpio/gpio-hlwd.c
+++ b/drivers/gpio/gpio-hlwd.c
@@ -303,8 +303,8 @@ static int hlwd_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id hlwd_gpio_match[] = {
-	{ .compatible = "nintendo,hollywood-gpio", },
-	{},
+	{ .compatible = "nintendo,hollywood-gpio" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, hlwd_gpio_match);
 
diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
index 88d48cfc9017..e791ba19928a 100644
--- a/drivers/gpio/gpio-ixp4xx.c
+++ b/drivers/gpio/gpio-ixp4xx.c
@@ -339,7 +339,7 @@ static const struct of_device_id ixp4xx_gpio_of_match[] = {
 	{
 		.compatible = "intel,ixp4xx-gpio",
 	},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, ixp4xx_gpio_of_match);
 
diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index d76c3cf177d1..edcff2fa8adc 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -519,7 +519,7 @@ static const struct of_device_id loongson_gpio_of_match[] = {
 		.compatible = "loongson,ls3a6000-gpio",
 		.data = &loongson_gpio_ls3a6000_data,
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, loongson_gpio_of_match);
 
diff --git a/drivers/gpio/gpio-lp3943.c b/drivers/gpio/gpio-lp3943.c
index e8e00daff7df..ab84f83aec86 100644
--- a/drivers/gpio/gpio-lp3943.c
+++ b/drivers/gpio/gpio-lp3943.c
@@ -209,7 +209,7 @@ static int lp3943_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id lp3943_gpio_of_match[] = {
-	{ .compatible = "ti,lp3943-gpio", },
+	{ .compatible = "ti,lp3943-gpio" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lp3943_gpio_of_match);
diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
index 37fc54fc7385..2dde79e45aae 100644
--- a/drivers/gpio/gpio-lpc32xx.c
+++ b/drivers/gpio/gpio-lpc32xx.c
@@ -532,8 +532,8 @@ static int lpc32xx_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id lpc32xx_gpio_of_match[] = {
-	{ .compatible = "nxp,lpc3220-gpio", },
-	{ },
+	{ .compatible = "nxp,lpc3220-gpio" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, lpc32xx_gpio_of_match);
 
diff --git a/drivers/gpio/gpio-macsmc.c b/drivers/gpio/gpio-macsmc.c
index b0952d066a9d..4afc73da2bee 100644
--- a/drivers/gpio/gpio-macsmc.c
+++ b/drivers/gpio/gpio-macsmc.c
@@ -274,8 +274,8 @@ static int macsmc_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id macsmc_gpio_of_table[] = {
-	{ .compatible = "apple,smc-gpio", },
-	{}
+	{ .compatible = "apple,smc-gpio" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, macsmc_gpio_of_table);
 
diff --git a/drivers/gpio/gpio-max7360.c b/drivers/gpio/gpio-max7360.c
index d12cf1dc8d57..a5a8f89e6c71 100644
--- a/drivers/gpio/gpio-max7360.c
+++ b/drivers/gpio/gpio-max7360.c
@@ -232,12 +232,12 @@ static int max7360_gpio_probe(struct platform_device *pdev)
 static const struct of_device_id max7360_gpio_of_match[] = {
 	{
 		.compatible = "maxim,max7360-gpo",
-		.data = &max7360_gpio_col_plat
+		.data = &max7360_gpio_col_plat,
 	}, {
 		.compatible = "maxim,max7360-gpio",
-		.data = &max7360_gpio_port_plat
-	}, {
-	}
+		.data = &max7360_gpio_port_plat,
+	},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, max7360_gpio_of_match);
 
diff --git a/drivers/gpio/gpio-max77759.c b/drivers/gpio/gpio-max77759.c
index da3c77dd574e..b2259d875751 100644
--- a/drivers/gpio/gpio-max77759.c
+++ b/drivers/gpio/gpio-max77759.c
@@ -495,7 +495,7 @@ static int max77759_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id max77759_gpio_of_id[] = {
-	{ .compatible = "maxim,max77759-gpio", },
+	{ .compatible = "maxim,max77759-gpio" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, max77759_gpio_of_id);
diff --git a/drivers/gpio/gpio-mm-lantiq.c b/drivers/gpio/gpio-mm-lantiq.c
index 1bd98c50a459..f48dc24151b1 100644
--- a/drivers/gpio/gpio-mm-lantiq.c
+++ b/drivers/gpio/gpio-mm-lantiq.c
@@ -134,7 +134,7 @@ static int ltq_mm_probe(struct platform_device *pdev)
 
 static const struct of_device_id ltq_mm_match[] = {
 	{ .compatible = "lantiq,gpio-mm" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, ltq_mm_match);
 
diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 1c6a2f3414f1..c26a97f8deac 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -487,8 +487,8 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id gpio_mockup_of_match[] = {
-	{ .compatible = "gpio-mockup", },
-	{},
+	{ .compatible = "gpio-mockup" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, gpio_mockup_of_match);
 
diff --git a/drivers/gpio/gpio-moxtet.c b/drivers/gpio/gpio-moxtet.c
index 4eb9f1a2779b..d87e9f4bd037 100644
--- a/drivers/gpio/gpio-moxtet.c
+++ b/drivers/gpio/gpio-moxtet.c
@@ -152,8 +152,8 @@ static int moxtet_gpio_probe(struct device *dev)
 }
 
 static const struct of_device_id moxtet_gpio_dt_ids[] = {
-	{ .compatible = "cznic,moxtet-gpio", },
-	{},
+	{ .compatible = "cznic,moxtet-gpio" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, moxtet_gpio_dt_ids);
 
diff --git a/drivers/gpio/gpio-mpc5200.c b/drivers/gpio/gpio-mpc5200.c
index 2c828bc922ae..14f6b0d5ccfc 100644
--- a/drivers/gpio/gpio-mpc5200.c
+++ b/drivers/gpio/gpio-mpc5200.c
@@ -177,8 +177,8 @@ static int mpc52xx_wkup_gpiochip_probe(struct platform_device *ofdev)
 }
 
 static const struct of_device_id mpc52xx_wkup_gpiochip_match[] = {
-	{ .compatible = "fsl,mpc5200-gpio-wkup", },
-	{}
+	{ .compatible = "fsl,mpc5200-gpio-wkup" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mpc52xx_wkup_gpiochip_match);
 
diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index e79312a7d5a4..fb280d87c578 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -306,17 +306,17 @@ static const struct mpc8xxx_gpio_devtype mpc8xxx_gpio_devtype_default = {
 };
 
 static const struct of_device_id mpc8xxx_gpio_ids[] = {
-	{ .compatible = "fsl,mpc8314-gpio", },
-	{ .compatible = "fsl,mpc8349-gpio", },
-	{ .compatible = "fsl,mpc8572-gpio", .data = &mpc8572_gpio_devtype, },
-	{ .compatible = "fsl,mpc8610-gpio", },
-	{ .compatible = "fsl,mpc5121-gpio", .data = &mpc512x_gpio_devtype, },
-	{ .compatible = "fsl,mpc5125-gpio", .data = &mpc5125_gpio_devtype, },
-	{ .compatible = "fsl,pq3-gpio",     },
-	{ .compatible = "fsl,ls1028a-gpio", },
-	{ .compatible = "fsl,ls1088a-gpio", },
-	{ .compatible = "fsl,qoriq-gpio",   },
-	{}
+	{ .compatible = "fsl,mpc8314-gpio" },
+	{ .compatible = "fsl,mpc8349-gpio" },
+	{ .compatible = "fsl,mpc8572-gpio", .data = &mpc8572_gpio_devtype },
+	{ .compatible = "fsl,mpc8610-gpio" },
+	{ .compatible = "fsl,mpc5121-gpio", .data = &mpc512x_gpio_devtype },
+	{ .compatible = "fsl,mpc5125-gpio", .data = &mpc5125_gpio_devtype },
+	{ .compatible = "fsl,pq3-gpio" },
+	{ .compatible = "fsl,ls1028a-gpio" },
+	{ .compatible = "fsl,ls1088a-gpio" },
+	{ .compatible = "fsl,qoriq-gpio" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mpc8xxx_gpio_ids);
 
diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 87086c322f08..7992167c0eb0 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -487,7 +487,7 @@ mt7621_gpio_probe(struct platform_device *pdev)
 
 static const struct of_device_id mt7621_gpio_match[] = {
 	{ .compatible = "mediatek,mt7621-gpio" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mt7621_gpio_match);
 
diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 7e2690d92df6..671e43102d78 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -138,7 +138,7 @@ static struct mxc_gpio_hwdata imx35_gpio_hwdata = {
 #define GPIO_INT_BOTH_EDGES	0x4
 
 static const struct of_device_id mxc_gpio_dt_ids[] = {
-	{ .compatible = "fsl,imx1-gpio", .data =  &imx1_imx21_gpio_hwdata },
+	{ .compatible = "fsl,imx1-gpio", .data = &imx1_imx21_gpio_hwdata },
 	{ .compatible = "fsl,imx21-gpio", .data = &imx1_imx21_gpio_hwdata },
 	{ .compatible = "fsl,imx31-gpio", .data = &imx31_gpio_hwdata },
 	{ .compatible = "fsl,imx35-gpio", .data = &imx35_gpio_hwdata },
diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index 5635694bf9f4..f2808fe8a3e8 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -250,8 +250,8 @@ static int mxs_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 }
 
 static const struct of_device_id mxs_gpio_dt_ids[] = {
-	{ .compatible = "fsl,imx23-gpio", .data = (void *) IMX23_GPIO, },
-	{ .compatible = "fsl,imx28-gpio", .data = (void *) IMX28_GPIO, },
+	{ .compatible = "fsl,imx23-gpio", .data = (void *)IMX23_GPIO },
+	{ .compatible = "fsl,imx28-gpio", .data = (void *)IMX28_GPIO },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mxs_gpio_dt_ids);
diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index 90293329b40b..32390bc00649 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -715,9 +715,9 @@ static int nmk_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id nmk_gpio_match[] = {
-	{ .compatible = "st,nomadik-gpio", },
-	{ .compatible = "mobileye,eyeq5-gpio", },
-	{}
+	{ .compatible = "st,nomadik-gpio" },
+	{ .compatible = "mobileye,eyeq5-gpio" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, nmk_gpio_match);
 
diff --git a/drivers/gpio/gpio-npcm-sgpio.c b/drivers/gpio/gpio-npcm-sgpio.c
index 83c77a2c0623..99f57bcf2b9c 100644
--- a/drivers/gpio/gpio-npcm-sgpio.c
+++ b/drivers/gpio/gpio-npcm-sgpio.c
@@ -596,9 +596,9 @@ static const struct npcm_clk_cfg npcm845_sgpio_pdata = {
 };
 
 static const struct of_device_id npcm_sgpio_of_table[] = {
-	{ .compatible = "nuvoton,npcm750-sgpio", .data = &npcm750_sgpio_pdata, },
-	{ .compatible = "nuvoton,npcm845-sgpio", .data = &npcm845_sgpio_pdata, },
-	{}
+	{ .compatible = "nuvoton,npcm750-sgpio", .data = &npcm750_sgpio_pdata },
+	{ .compatible = "nuvoton,npcm845-sgpio", .data = &npcm845_sgpio_pdata },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, npcm_sgpio_of_table);
 
diff --git a/drivers/gpio/gpio-octeon.c b/drivers/gpio/gpio-octeon.c
index 777e20c608dc..2854443226b7 100644
--- a/drivers/gpio/gpio-octeon.c
+++ b/drivers/gpio/gpio-octeon.c
@@ -121,7 +121,7 @@ static const struct of_device_id octeon_gpio_match[] = {
 	{
 		.compatible = "cavium,octeon-3860-gpio",
 	},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, octeon_gpio_match);
 
diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index e39723b5901b..015cf0f542ec 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1393,7 +1393,7 @@ static const struct of_device_id omap_gpio_match[] = {
 		.compatible = "ti,omap2-gpio",
 		.data = &omap2_pdata,
 	},
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, omap_gpio_match);
 
diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index e64ee0487718..ebf2a29d8210 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -151,11 +151,11 @@ static const struct palmas_device_data tps80036_dev_data = {
 };
 
 static const struct of_device_id of_palmas_gpio_match[] = {
-	{ .compatible = "ti,palmas-gpio", .data = &palmas_dev_data,},
-	{ .compatible = "ti,tps65913-gpio", .data = &palmas_dev_data,},
-	{ .compatible = "ti,tps65914-gpio", .data = &palmas_dev_data,},
-	{ .compatible = "ti,tps80036-gpio", .data = &tps80036_dev_data,},
-	{ },
+	{ .compatible = "ti,palmas-gpio", .data = &palmas_dev_data },
+	{ .compatible = "ti,tps65913-gpio", .data = &palmas_dev_data },
+	{ .compatible = "ti,tps65914-gpio", .data = &palmas_dev_data },
+	{ .compatible = "ti,tps80036-gpio", .data = &tps80036_dev_data },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, of_palmas_gpio_match);
 
diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
index db027c10494f..8f4f97d723fd 100644
--- a/drivers/gpio/gpio-pca9570.c
+++ b/drivers/gpio/gpio-pca9570.c
@@ -171,7 +171,7 @@ static const struct i2c_device_id pca9570_id_table[] = {
 MODULE_DEVICE_TABLE(i2c, pca9570_id_table);
 
 static const struct of_device_id pca9570_of_match_table[] = {
-	{ .compatible = "dlg,slg7xl45106", .data = &slg7xl45106_gpio},
+	{ .compatible = "dlg,slg7xl45106", .data = &slg7xl45106_gpio },
 	{ .compatible = "nxp,pca9570", .data = &pca9570_gpio },
 	{ .compatible = "nxp,pca9571", .data = &pca9571_gpio },
 	{ /* sentinel */ }
diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
index 75a8f3efaf94..bb533070f46b 100644
--- a/drivers/gpio/gpio-pisosr.c
+++ b/drivers/gpio/gpio-pisosr.c
@@ -156,7 +156,7 @@ static const struct spi_device_id pisosr_gpio_id_table[] = {
 MODULE_DEVICE_TABLE(spi, pisosr_gpio_id_table);
 
 static const struct of_device_id pisosr_gpio_of_match_table[] = {
-	{ .compatible = "pisosr-gpio", },
+	{ .compatible = "pisosr-gpio" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, pisosr_gpio_of_match_table);
diff --git a/drivers/gpio/gpio-pmic-eic-sprd.c b/drivers/gpio/gpio-pmic-eic-sprd.c
index cb015fb5c946..8012ca4299f6 100644
--- a/drivers/gpio/gpio-pmic-eic-sprd.c
+++ b/drivers/gpio/gpio-pmic-eic-sprd.c
@@ -362,7 +362,7 @@ static int sprd_pmic_eic_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id sprd_pmic_eic_of_match[] = {
-	{ .compatible = "sprd,sc2731-eic", },
+	{ .compatible = "sprd,sc2731-eic" },
 	{ /* end of list */ }
 };
 MODULE_DEVICE_TABLE(of, sprd_pmic_eic_of_match);
diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 7aaed5b30e7e..8bcbc76905a2 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -573,15 +573,15 @@ static const struct irq_domain_ops pxa_irq_domain_ops = {
 
 #ifdef CONFIG_OF
 static const struct of_device_id pxa_gpio_dt_ids[] = {
-	{ .compatible = "intel,pxa25x-gpio",	.data = &pxa25x_id, },
-	{ .compatible = "intel,pxa26x-gpio",	.data = &pxa26x_id, },
-	{ .compatible = "intel,pxa27x-gpio",	.data = &pxa27x_id, },
-	{ .compatible = "intel,pxa3xx-gpio",	.data = &pxa3xx_id, },
-	{ .compatible = "marvell,pxa93x-gpio",	.data = &pxa93x_id, },
-	{ .compatible = "marvell,mmp-gpio",	.data = &mmp_id, },
-	{ .compatible = "marvell,mmp2-gpio",	.data = &mmp2_id, },
-	{ .compatible = "marvell,pxa1928-gpio",	.data = &pxa1928_id, },
-	{}
+	{ .compatible = "intel,pxa25x-gpio",	.data = &pxa25x_id },
+	{ .compatible = "intel,pxa26x-gpio",	.data = &pxa26x_id },
+	{ .compatible = "intel,pxa27x-gpio",	.data = &pxa27x_id },
+	{ .compatible = "intel,pxa3xx-gpio",	.data = &pxa3xx_id },
+	{ .compatible = "marvell,pxa93x-gpio",	.data = &pxa93x_id },
+	{ .compatible = "marvell,mmp-gpio",	.data = &mmp_id },
+	{ .compatible = "marvell,mmp2-gpio",	.data = &mmp2_id },
+	{ .compatible = "marvell,pxa1928-gpio",	.data = &pxa1928_id },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, pxa_gpio_dt_ids);
 
diff --git a/drivers/gpio/gpio-qixis-fpga.c b/drivers/gpio/gpio-qixis-fpga.c
index b590572ac2bd..00bef538f94f 100644
--- a/drivers/gpio/gpio-qixis-fpga.c
+++ b/drivers/gpio/gpio-qixis-fpga.c
@@ -91,8 +91,7 @@ static const struct of_device_id qixis_cpld_gpio_of_match[] = {
 		.compatible = "fsl,ls1046aqds-fpga-gpio-stat-pres2",
 		.data = &ls1046aqds_stat_pres2_cfg,
 	},
-
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, qixis_cpld_gpio_of_match);
 
diff --git a/drivers/gpio/gpio-rda.c b/drivers/gpio/gpio-rda.c
index 7bbc6f0ce4c8..c9aaf2ae6f12 100644
--- a/drivers/gpio/gpio-rda.c
+++ b/drivers/gpio/gpio-rda.c
@@ -280,7 +280,7 @@ static int rda_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id rda_gpio_of_match[] = {
-	{ .compatible = "rda,8810pl-gpio", },
+	{ .compatible = "rda,8810pl-gpio" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rda_gpio_of_match);
diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
index 4a606bad5848..b54e5fe9af88 100644
--- a/drivers/gpio/gpio-realtek-otto.c
+++ b/drivers/gpio/gpio-realtek-otto.c
@@ -356,7 +356,7 @@ static const struct of_device_id realtek_gpio_of_match[] = {
 		.compatible = "realtek,rtl9607-gpio",
 		.data = (void *)GPIO_PORTS_REVERSED,
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, realtek_gpio_of_match);
 
diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 77b239a9a601..0f46ff095a24 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -806,9 +806,9 @@ static void rockchip_gpio_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id rockchip_gpio_match[] = {
-	{ .compatible = "rockchip,gpio-bank", },
+	{ .compatible = "rockchip,gpio-bank" },
 	{ .compatible = "rockchip,rk3188-gpio-bank0" },
-	{ },
+	{ }
 };
 
 static struct platform_driver rockchip_gpio_driver = {
diff --git a/drivers/gpio/gpio-sama5d2-piobu.c b/drivers/gpio/gpio-sama5d2-piobu.c
index 5005688f6e67..ab8655e9a518 100644
--- a/drivers/gpio/gpio-sama5d2-piobu.c
+++ b/drivers/gpio/gpio-sama5d2-piobu.c
@@ -228,7 +228,7 @@ static int sama5d2_piobu_probe(struct platform_device *pdev)
 
 static const struct of_device_id sama5d2_piobu_ids[] = {
 	{ .compatible = "atmel,sama5d2-secumod" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, sama5d2_piobu_ids);
 
diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index e9a992cd4b9c..5b719b9f7650 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -258,7 +258,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 static const struct of_device_id sifive_gpio_match[] = {
 	{ .compatible = "sifive,gpio0" },
 	{ .compatible = "sifive,fu540-c000-gpio" },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, sifive_gpio_match);
 
diff --git a/drivers/gpio/gpio-sl28cpld.c b/drivers/gpio/gpio-sl28cpld.c
index ca7a9b9bcf48..ac9cf23a865f 100644
--- a/drivers/gpio/gpio-sl28cpld.c
+++ b/drivers/gpio/gpio-sl28cpld.c
@@ -141,7 +141,7 @@ static const struct of_device_id sl28cpld_gpio_of_match[] = {
 	{ .compatible = "kontron,sl28cpld-gpio", .data = (void *)SL28CPLD_GPIO },
 	{ .compatible = "kontron,sl28cpld-gpi", .data = (void *)SL28CPLD_GPI },
 	{ .compatible = "kontron,sl28cpld-gpo", .data = (void *)SL28CPLD_GPO },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, sl28cpld_gpio_of_match);
 
diff --git a/drivers/gpio/gpio-spear-spics.c b/drivers/gpio/gpio-spear-spics.c
index 3099deb2b290..6df67b6bdf34 100644
--- a/drivers/gpio/gpio-spear-spics.c
+++ b/drivers/gpio/gpio-spear-spics.c
@@ -155,7 +155,7 @@ static int spics_gpio_probe(struct platform_device *pdev)
 
 static const struct of_device_id spics_gpio_of_match[] = {
 	{ .compatible = "st,spear-spics-gpio" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, spics_gpio_of_match);
 
diff --git a/drivers/gpio/gpio-sprd.c b/drivers/gpio/gpio-sprd.c
index 042a83f60eaa..7ddbe0eb500d 100644
--- a/drivers/gpio/gpio-sprd.c
+++ b/drivers/gpio/gpio-sprd.c
@@ -261,7 +261,7 @@ static int sprd_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id sprd_gpio_of_match[] = {
-	{ .compatible = "sprd,sc9860-gpio", },
+	{ .compatible = "sprd,sc9860-gpio" },
 	{ /* end of list */ }
 };
 MODULE_DEVICE_TABLE(of, sprd_gpio_of_match);
diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 6faf30347a36..e88cc6ff9ec0 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -533,7 +533,7 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id stmpe_gpio_of_matches[] = {
-	{ .compatible = "st,stmpe-gpio", },
+	{ .compatible = "st,stmpe-gpio" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, stmpe_gpio_of_matches);
diff --git a/drivers/gpio/gpio-stp-xway.c b/drivers/gpio/gpio-stp-xway.c
index 78d6c78d4aab..37c480c1f031 100644
--- a/drivers/gpio/gpio-stp-xway.c
+++ b/drivers/gpio/gpio-stp-xway.c
@@ -315,7 +315,7 @@ static int xway_stp_probe(struct platform_device *pdev)
 
 static const struct of_device_id xway_stp_match[] = {
 	{ .compatible = "lantiq,gpio-stp-xway" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, xway_stp_match);
 
diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index fa6c8ee92093..d42b644000b2 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -669,7 +669,7 @@ static const struct dev_pm_ops tegra_gpio_pm_ops = {
 };
 
 static const struct of_device_id tegra_pmc_of_match[] = {
-	{ .compatible = "nvidia,tegra210-pmc", },
+	{ .compatible = "nvidia,tegra210-pmc" },
 	{ /* sentinel */ },
 };
 
diff --git a/drivers/gpio/gpio-tps65218.c b/drivers/gpio/gpio-tps65218.c
index bf85663349fb..79e13adeb21e 100644
--- a/drivers/gpio/gpio-tps65218.c
+++ b/drivers/gpio/gpio-tps65218.c
@@ -196,7 +196,7 @@ static int tps65218_gpio_probe(struct platform_device *pdev)
 
 static const struct of_device_id tps65218_dt_match[] = {
 	{ .compatible = "ti,tps65218-gpio" },
-	{  }
+	{ }
 };
 MODULE_DEVICE_TABLE(of, tps65218_dt_match);
 
diff --git a/drivers/gpio/gpio-ts4800.c b/drivers/gpio/gpio-ts4800.c
index 0207c2b813f4..a67f6808ea16 100644
--- a/drivers/gpio/gpio-ts4800.c
+++ b/drivers/gpio/gpio-ts4800.c
@@ -48,8 +48,8 @@ static int ts4800_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id ts4800_gpio_of_match[] = {
-	{ .compatible = "technologic,ts4800-gpio", },
-	{},
+	{ .compatible = "technologic,ts4800-gpio" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, ts4800_gpio_of_match);
 
diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index a851702befde..d61bf331395d 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -604,8 +604,8 @@ static int gpio_twl4030_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id twl_gpio_match[] = {
-	{ .compatible = "ti,twl4030-gpio", },
-	{ },
+	{ .compatible = "ti,twl4030-gpio" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, twl_gpio_match);
 
diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index adfa2c2d5873..0b67194de573 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -79,8 +79,8 @@ static const struct fsl_gpio_soc_data imx8ulp_data = {
 
 static const struct of_device_id vf610_gpio_dt_ids[] = {
 	{ .compatible = "fsl,vf610-gpio",	.data = &vf610_data },
-	{ .compatible = "fsl,imx7ulp-gpio",	.data = &imx_data, },
-	{ .compatible = "fsl,imx8ulp-gpio",	.data = &imx8ulp_data, },
+	{ .compatible = "fsl,imx7ulp-gpio",	.data = &imx_data },
+	{ .compatible = "fsl,imx8ulp-gpio",	.data = &imx8ulp_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, vf610_gpio_dt_ids);
diff --git a/drivers/gpio/gpio-visconti.c b/drivers/gpio/gpio-visconti.c
index 6d5d829634ad..59e57b8e8604 100644
--- a/drivers/gpio/gpio-visconti.c
+++ b/drivers/gpio/gpio-visconti.c
@@ -219,7 +219,7 @@ static int visconti_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id visconti_gpio_of_match[] = {
-	{ .compatible = "toshiba,gpio-tmpv7708", },
+	{ .compatible = "toshiba,gpio-tmpv7708" },
 	{ /* end of table */ }
 };
 MODULE_DEVICE_TABLE(of, visconti_gpio_of_match);
diff --git a/drivers/gpio/gpio-waveshare-dsi.c b/drivers/gpio/gpio-waveshare-dsi.c
index 38f52351bb58..bb862f450140 100644
--- a/drivers/gpio/gpio-waveshare-dsi.c
+++ b/drivers/gpio/gpio-waveshare-dsi.c
@@ -190,7 +190,7 @@ static int waveshare_gpio_probe(struct i2c_client *i2c)
 
 static const struct of_device_id waveshare_gpio_dt_ids[] = {
 	{ .compatible = "waveshare,dsi-touch-gpio" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, waveshare_gpio_dt_ids);
 
diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index 30b6e9f3f8ba..b1e0008679d0 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -334,7 +334,7 @@ static void xgene_gpio_sb_remove(struct platform_device *pdev)
 
 static const struct of_device_id xgene_gpio_sb_of_match[] = {
 	{ .compatible = "apm,xgene-gpio-sb" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, xgene_gpio_sb_of_match);
 
diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index f4adf2962557..2aa0432dab7f 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -188,8 +188,8 @@ static int xgene_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id xgene_gpio_of_match[] = {
-	{ .compatible = "apm,xgene-gpio", },
-	{},
+	{ .compatible = "apm,xgene-gpio" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, xgene_gpio_of_match);
 
diff --git a/drivers/gpio/gpio-xgs-iproc.c b/drivers/gpio/gpio-xgs-iproc.c
index 77eb29dcc217..211e64b793a6 100644
--- a/drivers/gpio/gpio-xgs-iproc.c
+++ b/drivers/gpio/gpio-xgs-iproc.c
@@ -310,7 +310,7 @@ static void iproc_gpio_remove(struct platform_device *pdev)
 
 static const struct of_device_id bcm_iproc_gpio_of_match[] = {
 	{ .compatible = "brcm,iproc-gpio-cca" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, bcm_iproc_gpio_of_match);
 
diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 532205175827..7a03a7301540 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -667,7 +667,7 @@ static int xgpio_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id xgpio_of_match[] = {
-	{ .compatible = "xlnx,xps-gpio-1.00.a", },
+	{ .compatible = "xlnx,xps-gpio-1.00.a" },
 	{ /* end of list */ },
 };
 
diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
index 3713475bdb75..03c216d6d03f 100644
--- a/drivers/gpio/gpio-xra1403.c
+++ b/drivers/gpio/gpio-xra1403.c
@@ -192,7 +192,7 @@ MODULE_DEVICE_TABLE(spi, xra1403_ids);
 
 static const struct of_device_id xra1403_spi_of_match[] = {
 	{ .compatible = "exar,xra1403" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, xra1403_spi_of_match);
 
diff --git a/drivers/gpio/gpio-zevio.c b/drivers/gpio/gpio-zevio.c
index f1c5c6a20673..78c6988b5027 100644
--- a/drivers/gpio/gpio-zevio.c
+++ b/drivers/gpio/gpio-zevio.c
@@ -210,8 +210,8 @@ static int zevio_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id zevio_gpio_of_match[] = {
-	{ .compatible = "lsi,zevio-gpio", },
-	{ },
+	{ .compatible = "lsi,zevio-gpio" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, zevio_gpio_of_match);
 
diff --git a/drivers/gpio/gpio-zynqmp-modepin.c b/drivers/gpio/gpio-zynqmp-modepin.c
index 5e651482e985..dcf41101a1e6 100644
--- a/drivers/gpio/gpio-zynqmp-modepin.c
+++ b/drivers/gpio/gpio-zynqmp-modepin.c
@@ -145,7 +145,7 @@ static int modepin_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id modepin_platform_id[] = {
-	{ .compatible = "xlnx,zynqmp-gpio-modepin", },
+	{ .compatible = "xlnx,zynqmp-gpio-modepin" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, modepin_platform_id);
-- 
2.55.0.11.g153666a7d9bb


