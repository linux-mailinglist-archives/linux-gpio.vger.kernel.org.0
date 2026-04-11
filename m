Return-Path: <linux-gpio+bounces-35038-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEcqK7I72mkqzQgAu9opvQ
	(envelope-from <linux-gpio+bounces-35038-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:16:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5363DFD0A
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:16:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A12E309C26E
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 12:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF6C355F3A;
	Sat, 11 Apr 2026 12:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvEe87M6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJpBNkv+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21D13563F6
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909469; cv=none; b=o/Etc/5v+ts2OOVYkMOjkmgmgClqF6wAFxJvizPaQwLaiebQIZcev8RomJXcPR7wE+cH+FC9c0YvmPlIlpXN6w3nkRx89k0UOX+nIc7GZ8uAU6oSrKvwThEl1dO8UyeTMpYbZddYAQTvIcNo6FYWGTqGlEUInF5cikD/Ac7s178=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909469; c=relaxed/simple;
	bh=DoendjqYMNCpaNDLx5nJc92Y8UtuCTST95sXT4ei12s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r/Ivubbbmp8JYkQywf2nvM8z+MGqSJgvC3SD3fuRUnextg0tPfYYrKFUQwYbANpRouKbhEuipbEl1LH21RO8bC0n1S06ij8YHT9VZXIa0ioSXwaYJ0+0AwdMC+G3ahhGqw66pectJdAW9FYSeAkA0YQ/4fu9PRTO2VMZMSaDRbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvEe87M6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJpBNkv+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B47idh1200641
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EacYV252Ylxyrr9FQ/70zKkziBbfMroxAzrIkM+nfi0=; b=lvEe87M6jsa0fiQz
	EevMhv+vCjFZzcBpxS3nTLtWlAuloiN5msMh/997rSEatRWHi/pXInJFWz91F6vk
	nS93IpmnyUM+dnagzOc96LAGLqxKjukSRZwiZ8LDE5In6Vy20v26RDQFcvuPYV9L
	sojz9J7FJTit2DxkU50Br1DNriG1MpoEJdb3E3y67nroorq6WD8PujV4inA2AiSM
	N4zLggm1lHtXu4T50gZt3hLz9HfPao9gvvTMhBKWK68oRCGLJt2qb/xdz0Mbrmll
	6PiCm7CYNexqtlOhgkaMP7lvN8a9lV/dygGiYgX8MDeCA0rUOboNal0NHkXadNJC
	6mswyg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jrn95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d6bf346adso60404921cf.1
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 05:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909466; x=1776514266; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EacYV252Ylxyrr9FQ/70zKkziBbfMroxAzrIkM+nfi0=;
        b=EJpBNkv+Nn0Fm8mU2UTsKtUzZMcKaIKBqGZ1WIKOvObXOhJHAluMayw8gsGAENzxMN
         VQdAdBa/9yicLMFQSAx1fqBfSOuzwS8IqhluqaAHc5u78g6BxJfWL/REkI1jHude9DQ6
         ugnfqKFG/t23tfBbWa4wxR74gd3Hi5qwpVbuRI+r/JNi3qCAPERo3uPBw7BXqOKgn1Y+
         6z9fTAgKgJXEckkJS9lHw+E/x3c+cmBxf6pyfojBsIm4FjqWjS7+VyNTQ8DlWUXyycZx
         J4Iovw+pIiblOOOT6/Snxqmr3PZ6NB40c3Rr41AuIMvgQBm3woVOGkTIglv6Qg5u8w71
         MvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909466; x=1776514266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EacYV252Ylxyrr9FQ/70zKkziBbfMroxAzrIkM+nfi0=;
        b=PnUab3DxGIfFhJq53gbESpX4xc9YhiRRbP2wUD8wWfahyDldASzKgdGARCcLdAr7RC
         Ag7AcTjuTya87XuPX0x4M1Xrluup0PBWVZGfRlZGBDXlB/e0HxOBiZZeWwHvIrJtbT1t
         giKRrmN4Jb0LgbAH/E6fVNzueeaAgAC2z0YK/5utUofSygeXCTMZWNegeeL7h6zDkQvD
         OQ05JCG7aurwdvNdVm9E1ieSILhC1ZiRjbR/ja344th0s1U57FJo7184RDRPRGjq06yf
         Wdb/76xPcKMkJc3hLRDAEH1o5cgH4wIcsyU6mUXI94bEqGFRm86NDp8H9Ok16CrNovrm
         oNBw==
X-Forwarded-Encrypted: i=1; AJvYcCVm8A32aCKiuyiQ1A1jBr5Xh5USThSPmUDB5BE+fua3N/JiYZ1CXmWe4NLqPBUztjQW5LwQQu37Z4j1@vger.kernel.org
X-Gm-Message-State: AOJu0YxWBrG9J/tcd0JvAOhYhS+a09FZHhEZrE3oPEXt7MEbqfsjjp5K
	lSyGQaU+wxvwrT88GsAN1EO3bvhyMEl8qk4JBLGu6VRan8r4c2UISZGQ0uf3Kif1xFMdlN2C8db
	muPPcEtgR3PmgUSod139nruNRZ8DsIZ95xEG1HEUazOeFgBhRkEHiHm1lukdspNGv
X-Gm-Gg: AeBDiesAlB0dbAro2Hy16Zyxp1ujZIfwDNIrOpuL6Dfb/xmUEJXC/OdKuK/SBAIzmhP
	Palqy7wzAGAA+hkVzEBm21PP11YA4mBLSoD60YoFrxotys9HBNDRA4QYXt/PGd08LJWxxH44PXF
	9OKSXaNUmEcqpcmsD0Z2ndqM8uKW6TgDpYZ5xcgQ/fWGJCUsDhQpObJXMeCLpQeo3opqeJ9oXiW
	JiOnuYBF+zDa5b1Ota9ngkiY2kaD1/o523GydbtEROGDRwfssK01ezGteMJDRaTMH08UzPR5gjP
	9o83lPtrZHvcpEcun+rdwZnOivI46FZ8BmjDie4r+n0vyPVvrmvcpTYZltSmihzVY5K6VjCVkAH
	YCxZh2pCe48qF4H9fNzsZKxcjs1NYRH5+beoljEPQWsycB206Cw5ViBN3p2SeOpm26VMFNbdqaq
	na+ESX0rnO7xlblzYLTdWItdXpSRWprJHG1Pk=
X-Received: by 2002:a05:622a:1189:b0:50d:7504:b719 with SMTP id d75a77b69052e-50dd5bd1ef1mr100580481cf.52.1775909465972;
        Sat, 11 Apr 2026 05:11:05 -0700 (PDT)
X-Received: by 2002:a05:622a:1189:b0:50d:7504:b719 with SMTP id d75a77b69052e-50dd5bd1ef1mr100579891cf.52.1775909465528;
        Sat, 11 Apr 2026 05:11:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:11:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:28 +0300
Subject: [PATCH v2 08/21] drm/panel: himax-hx8394: set prepare_prev_first
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-8-75cdbeac5156@oss.qualcomm.com>
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DoendjqYMNCpaNDLx5nJc92Y8UtuCTST95sXT4ei12s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpFW0vQ244JNcxKBxL5K1n8VoGz1ZRi3WrEQ
 5MkXyOolKCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RQAKCRCLPIo+Aiko
 1VKVB/4ix4mqEZIje288JrijjZjm+C+aALrGxc+Zgv/a4M8FE9MuOwcE/LLV2qNiMBQ2DBwcTM3
 Cv5q7Rbyi8yCqXWubKIsKGFzkrxWqqubVpIIRco4W2E7MrAOfqaBH8USgRdOSmYqJYx9gHqGANo
 FPZE8gnLR9Ytjnn12c0Rn4nsxOe3ksg4j3jwtBK4lpJSd9Ki+j7H8FqXQMzr6dVMP3ffuy/hOjB
 mlbQ9jyDfbJslkpyXU542botlevdq0Hxe73OcmwOgEYbdJLcj3wp9knZBh+l57zyfAcSwEPkdOU
 f7iBc+j3jB6DPyIMi0pEMOi7EQbPvpCRmoLJym+b4JBdYJN6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfXw/Yvu5x9RkuW
 BAS0aF5sA638K3P9fvYHZkcFDBfv4rcqkW3bcoIr3Xwf62+imufKA5xxQ4SJk5Ye72MSiG8L9vx
 kpYgdC1yFyveR2izDBSyfNuBNMiLt1AI6K9vy7FRQ0nEbIMo2F5djHHglkBRTOVXbibfX0HQmPr
 F//YJNb4Gpwc906ciJjD26lGfMasucRwCoHvTesSKv9OP727q0+jqsPcui7scTXqqHQUU8HYocY
 4BBJhUtEDZuZpjzTZcsXYiJamsvDCBjE63jL881jIewWBSb/5hpykWLFBW4uTfjleLKor5wvdWV
 5fjA69gHRqKybfmRQRoS121FN3JTiEvs/Bb9uoUpA5VafyZIRZIhSwP9SyevAgkZ7xhJ6jLz0LY
 nhZsaBP7E1MFlu9L3NEqS3o1V+EcBZFHGUY448+9M73GUbvzDfsUoEq4LqqpxqjAEvGqvxRxrtS
 mtep3O8dIyjjTqRlQxg==
X-Proofpoint-ORIG-GUID: LI0x-sO8pTU_Sw84Uy1QFkDDR5VeVhMg
X-Proofpoint-GUID: LI0x-sO8pTU_Sw84Uy1QFkDDR5VeVhMg
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69da3a5a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=ic6V0yA_i5s2A4o5CdYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110102
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35038-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0E5363DFD0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sending DSI commands from the prepare() callback requires DSI link to be
up at that point. For DSI hosts is guaranteed only if the panel driver
sets the .prepare_prev_first flag. Set it to let these panels work with
the DSI hosts which don't power on the link in their .mode_set callback.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index c4d3e09a228d..d64f3521eb15 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -792,6 +792,8 @@ static int hx8394_probe(struct mipi_dsi_device *dsi)
 	if (ret)
 		return ret;
 
+	ctx->panel.prepare_prev_first = true;
+
 	drm_panel_add(&ctx->panel);
 
 	ret = mipi_dsi_attach(dsi);

-- 
2.47.3


