Return-Path: <linux-gpio+bounces-37189-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALYtKyJ5DWqfxwUAu9opvQ
	(envelope-from <linux-gpio+bounces-37189-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 11:04:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B6A58A5D0
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 11:04:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1F24327D77D
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 08:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054CB3B9D96;
	Wed, 20 May 2026 08:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UCxI3SaB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qpwy8aGa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DE13B9617
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 08:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779266957; cv=none; b=dmbPXJHQvXWl2YX9c2ay9JzfJjXctSH0D6CRW/lNFmvok45+/2IoRHxPEwlryh5ZP7tODvZbN8I7lIThJA5rfgkXKPYRLIHw0L1Rhma4xznNMwVMuCoaJx1c+7drDUVtWg+SwzyjPYtrgJk5VdEIFm4wsLn5/NrhGRRo5n7XyWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779266957; c=relaxed/simple;
	bh=WiCz7g91WpYB6xzS8HpLMaG7aEoTI14G5ZC41wwSH4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i6SSdM21PfA+6gzaVCccw9kDWWykfR2bK8DDAKStrc8x6sdG/jFY2CvKR2cQLuCyiL9riVuMufFYQc2V0zDupr5/a0CNjSAVeRjd49bNYeR6+5i1mEw+LBvd8PmHfKCEbD0x/Bj4JGkz55y73lNZ+z2EZe90qZtwMscQID+eFq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UCxI3SaB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qpwy8aGa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6opfo1953964
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 08:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iFYSJgra8c5vxgD8K+xt3jU8404bx8CrRy/
	AqEcbe0M=; b=UCxI3SaBvitSrjJOWY7C9Y18LDswRSiFwnwV2QfPp+DpuREsmRr
	oVx67GEN/b1JXqQun+cCaF9A4tyceDbnFABjDVHhRlTYx+G9XiHtofUhygwL1etR
	kH1SyvyQVcZQwI0q0ZmUS9H7bwZqWRsB8p/M0B8KYzxmBoUCA/pc8JafvsbK1RhH
	WkUDSYestDp2gzznuKlBzPXQLvoL6IcnISqc3kq1kSOpGshFEnHMuvxa8bsuzSx1
	rxuvM/4FJTCCxMkx7dNajILNmhQ1uTAVARaYgqLD5+TDDrvnk2nCTHF32ePE2nw0
	zz7DtQoqWFEqcknAqlfPgBSJWXD2/gVwf0g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3xuwa1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 08:49:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so135143401cf.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 01:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779266955; x=1779871755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iFYSJgra8c5vxgD8K+xt3jU8404bx8CrRy/AqEcbe0M=;
        b=Qpwy8aGaZ+XZ3eQJwBO9cxU+wWp2BuVaF0dMFkg2bZxFNU0fXZVgSZ1tFeYDC597Ba
         l4UDzt6ZxjkAHA9hDk7rLNRr4gRi8/DXqENcpygBy2Erb6WhC/eYFxxZgCThnTbr/evA
         syKE4snJ5k51PLTjxqCH/mh+ZnYv9OgsNA8CVZqEhCXu43jeT96HMQuUJPvrzmQ1vSSf
         R6oeuvWm4A5e31mAeg3hdv/BP+BTx8cDMFrOXS1xc9caPqG2Br2lE+H5ZKEPHbDvsKlb
         Y+ZObonVmwO8hzlX18aKTSZ43Vz3NkGFk49lWCntIeMjQ3Dik+0VH8T03lEgx4x9dHhv
         x7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779266955; x=1779871755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFYSJgra8c5vxgD8K+xt3jU8404bx8CrRy/AqEcbe0M=;
        b=NMbtaH/Rcrr9K1BGl/t/muNeHqwxZ8pNSDULXOL7CFhltImsmPeIeMUNF2ecS1eaCR
         oPrxtmmYqRPDyHw8kWXIFzGYELG8foJkXr2h8QXl6ueA0gxrbx8przjtP16R1an3c/dk
         L1AW/cexX7LfTbxGuk69Ngmwog2ubLCLXqT7T8dlzOcxWT58TVZyxQC6m0ZLDV+pLwev
         jaIZfe5cqkHsoXKpU1rg5JGxe//QEYnPEgGS5jg6IVwItsk3CsVrmxU/o7/dwYhqTQts
         kr1RYDgfTj234/ijGwV0k6KG0O4S6a3q+s61G9Att4+rRRVD4veZbXFglFqRzLZro1Xp
         Z+yA==
X-Gm-Message-State: AOJu0YwjthdkGAchlvTMeiws9m1Gs1k37XumqzKTcTLW9FsaxBVMPhmE
	bsCelKD54KyqoOqv8auue1Xm2RLOM7UyTCLTm+hqaQAWzXxyBxgRGLfvEl27EtMOf1tKQ3tDB9v
	M4PHReda788qo2NzsWmKYp/unHKcEeZr3/qy2T6jUcqx4CfylehGVCgCP8Fk8kQv+
X-Gm-Gg: Acq92OFu17RPADXMCeh5oC9esgrZ0NDOSiG6MIDuBk7E6oBFI+ipGeLOoOZpN8D/FHU
	x+PG9hTQ6q3xpwbpEHCSh4KcbSeiXFGEDTwNwBIMc4I4eRmzSjWW+79hyTHImpa9vmbKQaWuX0X
	af+J7mAqydHVQ1gjENqIqs0jvgG36X9v2Lyf/yEN17h46LUGyrvaSKYiJwLWWdqyH2uEcgiycZT
	D5AISxdk8q/mCI6jZhLueDt2UNBGROedyRyPpcsMGjRmPW80UaCpzCXYfDqdF9NZqn3jVXeJzI+
	wjufHQkl5oScvuomuprqNbq/Xj0rJJ6+B2ug1ChmOJITvsvgDHwJigKGNb9MOsb9osLnpEucAC4
	w7djQi9zNFypkFr3kRn+BKN1mrjfftC+jzWWXkQ98O3wEhfmzmg==
X-Received: by 2002:a05:622a:4085:b0:510:141d:9d03 with SMTP id d75a77b69052e-51659ff9d60mr338521541cf.7.1779266954899;
        Wed, 20 May 2026 01:49:14 -0700 (PDT)
X-Received: by 2002:a05:622a:4085:b0:510:141d:9d03 with SMTP id d75a77b69052e-51659ff9d60mr338521241cf.7.1779266954412;
        Wed, 20 May 2026 01:49:14 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:9ec3:885a:6d78:48d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a17a22sm52480643f8f.22.2026.05.20.01.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:49:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] gpio: aggregator: fix a potential use-after-free
Date: Wed, 20 May 2026 10:49:11 +0200
Message-ID: <20260520084911.27938-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WaY8rUhX c=1 sm=1 tr=0 ts=6a0d758b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=IYF4p_Y9mJ23m3Ro410A:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Ux3Xw0z_AG4tPGYxFj_YYeX99kU65Hmj
X-Proofpoint-ORIG-GUID: Ux3Xw0z_AG4tPGYxFj_YYeX99kU65Hmj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA4NCBTYWx0ZWRfX73ATcEcIzDAs
 hnwB943kQ6di5WFod74x2tu68pYwgDAa+HGbCqz9nFoG13Dh2OU0NbVX4EDL8EVi1SNJDpzoXKt
 dqYw1MHV8q0o4G8PY6uH9aM8s2FUZ6mXbpzNuqrrVwGOIaLr5l9sBa7/WKbjL6Yn4xdZtMWh87u
 nVZbKVYtXn7zBrFVl0PqubX+atwWDiRTORrTgWdhz1x7JXkyI5qunakZPCKcjjy2TSfUz6HIjpI
 u4Hm8DXmYjbgeChTjRzstzMxIEjUOShyOI+ySF+wFWMX+GC4pvkeql0ZywZ4NkLFjevWAE9h6Rl
 yIy0JxyzbXJHMniowZQSn7RjkLFfrRwURRbdo9lz3W93CEvVROQXuCW4g07ZEwMDqbrepY9+zs0
 BWmG5qZY/HL7s82IWE2hFZiLuRjkbSIIHVnV0EBtffNnETw7ffQPWlxlt5AHrAB7G/T7xLwFTXV
 DRF69hYxrv0nvSEdKrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200084
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37189-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 13B6A58A5D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On error we free aggr->lookups->dev_id before removing the entry from
the lookup table. If a concurrent thread calls gpiod_find() before we
remove the entry, it could iterate over the list and call
gpiod_match_lookup_table() which unconditionally dereferences dev_id
when calling strcmp(). Reverse the order of cleanup.

Fixes: 86f162e73d2d ("gpio: aggregator: introduce basic configfs interface")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-aggregator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 5915209e1e21..b53230065f50 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -979,8 +979,8 @@ static int gpio_aggregator_activate(struct gpio_aggregator *aggr)
 err_unregister_pdev:
 	platform_device_unregister(pdev);
 err_remove_lookup_table:
-	kfree(aggr->lookups->dev_id);
 	gpiod_remove_lookup_table(aggr->lookups);
+	kfree(aggr->lookups->dev_id);
 err_remove_swnode:
 	fwnode_remove_software_node(swnode);
 err_remove_lookups:
-- 
2.47.3


