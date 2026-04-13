Return-Path: <linux-gpio+bounces-35108-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAPFNbH53GnXYgkAu9opvQ
	(envelope-from <linux-gpio+bounces-35108-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:12:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 981E63ED218
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34332302428B
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 14:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C68A3D47B0;
	Mon, 13 Apr 2026 14:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AUHlFM3R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V7aVyx0m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830103D648C
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089169; cv=none; b=Jw1IztSv61qVKf3VtvW/bDLLatFNTAkQrlxWf2jgAtdDhN5/s7bnmdcwg45vzXDWPs0sL0YlWq5bp1gmaRN0SsqU1a8NeyvmudQtvPGkDBAcT7ppxl62csvguUa4mzauhPQ8ikoob2ZGNLnY/Q+kTYKiGn7Q7Sgm9DvQNVGns7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089169; c=relaxed/simple;
	bh=2OhwTmez/fN6vzgtCuASLky1gWVkSsam5T/8/+hvPxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LMXPCWRa72uTjesyrhGx+25Ia83Z8hHEIjbS7hxbgNvolm8uN+1b9owgRkG6kt7TDC/A1+BsL9qBrUXxFixaWMoHRdjwAyRKEBfSFUwYc7imW9fCX09H/YX6CmiRdm9Kr/kCo94d2qR1+azj1fYog+HQK/Nt++h+hNKPI8opjoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AUHlFM3R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7aVyx0m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D78wi5479777
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2M46GkeAbIKNMo4RtIIN5JRHYxM3CJJlJxRZYNibdps=; b=AUHlFM3RovNhG89f
	n3TrDBgW8RSL8eqtxi17jkrXV7ROzbcRhgUQI3mLzPhKLvfnUwuTjMZdpHtIdvws
	oDzqr7Mx1ZKApu+dzIPi5Rj+EwcN8CE+aiAVy1zakwqWJuuGUUwoDG70/fTNMmJ+
	dwXaeuFXeKC8DhtYITReakBhOWNKT7rXRhmaKwrJcJup/MqDIa/7ubjSfy9mthzR
	w3ZwM9e2/IHRmZpUCLCYt+mkHJl4hyHxYXV7DH4SCN+sPzgvFR9UMMmiPDvgHzaz
	tuASG5jgFu5kwvo4PXThtnVJUz+18xBHYW+5eQcN7EWAMRGUy+ierckYUfiiBKiq
	MJM3Cw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dguuj9dnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:06:04 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-472728429d6so6355060b6e.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 07:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089164; x=1776693964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2M46GkeAbIKNMo4RtIIN5JRHYxM3CJJlJxRZYNibdps=;
        b=V7aVyx0m2Hj83mj6w/8PLM58o5GihMX3qIeH9dJVzXALXbF1KxZBxa1s91PO591EXO
         ksYwu4LeXjOw9j72ZTc63Nc+Hf3a2i0yFI3mthgqTrSak/5t54zYIqCZWg2HEHGqIb4a
         QP0rNwnw5ztylAA6cfYwnBWjk6iQTeeWejO7XiEERB3unEKT61y0ONNtWBim19dJMsc3
         meJsB1JodaW9yeEoIFrKyhtM8oIXd3ymgE2GgIb/SscuJTOUUXZEkKrnEJKm2fkduTIE
         pz+vFahJCwKYpcBQQJrlb7e1oktSVDwZCgbAlhjU03WdY79f7542UFfcyLNoF7yKlDnT
         MESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089164; x=1776693964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2M46GkeAbIKNMo4RtIIN5JRHYxM3CJJlJxRZYNibdps=;
        b=BWpdmWYBoBejJT8ixlwaol0EJSEDSt6bxaZk/qboRLfkIUUeXvEckPESx2O1wn+dRr
         toavKW4Z8B2xRmgQ86a5CnxU9aK0RXMQu1/MIMqtPwLtBC37vfoas3e7LJR6oPh8Os55
         e7rrogENpWmOM1nFju8FxqZdx0384LvwwWJCVOEbkzsANesSHCLXXOjdLZb74nQLOiKS
         9wAa6LWtLS0ZFN0HxYOqyDg9k7UsAv0dNhzpYyTVvcl8fAThiU29QpwGu8PGTQYkK8qi
         /JZBcVy5+tOjGYS4UGUGorOCWpEVxqRFGUSbgfWpjMXQH+GF3beryYp/FZbLPrSW6zGv
         PBjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+MWHkpiYLC+W6XCuCiYOW7QbAbYn+f19sJuYahTPelgX0UdOwkQsg+Y2z9TpdVDmEG8cYq+unhg6NG@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/gY0CPXPQuQhi//xa5Cq9eLnOmS3F0v//4TZA1sb+E0NPiAPb
	hyYevOLn6wc2evaW/Aql7kbotltYywNSfjvkmsM4cEhDyDz7ssFfoLOX2f9a5N8LxiHTKe8Wkkn
	pOMuXqjmczSv9TsQNwhM4Wo44inLc/Yov49xebsn81sw03vNyMIwN4/UPF6780usy
X-Gm-Gg: AeBDietHJ7Y64Lu1si8myABIGx+tdgCsEuZvJ6jm/i57QT5NRN39af3YifNAFkG6Xed
	wc7FlfM/sBfiBchQ8WlgEmjAUyTp1lZMnH79iUtEZ+2CDtWVxJ/IihkHY6PTvgrfJp/XtsikKM7
	91ZPJ/DajKueNC2yJ46dNqJu1stL3U7kQUQ54Hhn1f80j4oHqgjP+/RUAoXstLFugAAassX/21I
	ryvJgfyiNEcISn3qUaA/eoZLyM1KOB5sZ1YttYdNDOT6yQnLnKYIDplQrll5P83PdtbJhlRAcJC
	tiMv9Hb9pWx7WaKES2+k548nM05rZThZrwsSIyNmhFO7Vc3EkeEnbjruUq8ShQJYSovkXUQ8yCU
	CeXP9ma3OY9Pog2ityrImyc0tsoPImZQX6ooU0gVGcYMPMlokGYB9y5vtM9ype8y+QTJX2A23zs
	DGGGBZhonHMeNAr544+1eVkoM4RLdsIYTf4ZI=
X-Received: by 2002:a05:6808:ec7:b0:467:cd8:7f5e with SMTP id 5614622812f47-4772a35f8ebmr7655834b6e.4.1776089163668;
        Mon, 13 Apr 2026 07:06:03 -0700 (PDT)
X-Received: by 2002:a05:6808:ec7:b0:467:cd8:7f5e with SMTP id 5614622812f47-4772a35f8ebmr7655803b6e.4.1776089163174;
        Mon, 13 Apr 2026 07:06:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:06:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:36 +0300
Subject: [PATCH v3 13/21] drm/panel: jadard-jd9365da-h3: set
 prepare_prev_first
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-13-3aeb53022c32@oss.qualcomm.com>
References: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
In-Reply-To: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Riccardo Mereu <r.mereu@arduino.cc>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2OhwTmez/fN6vzgtCuASLky1gWVkSsam5T/8/+hvPxI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp3PgoIvRLeRiGDxBhVYJ75H7QTnl71YAKsM74I
 b+hcuYNB7SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadz4KAAKCRCLPIo+Aiko
 1efWB/9yk/B1B2SCIZWMOvjs+HwMFFvQySMKbTEjbph8t99biLPGBfyJMwgu7HO49P/RTZDPczo
 4VamEYzP5ghhE2SKdUfG6LF4Zp3D2XmXbRglGcXbwIcto9hEfFOs/8k1r3/FC+ffkzfqKayWM7g
 gC5LupcqGmFL7qRKrzIlY/01Vs7wnCr8l6elkJ8EfR0ZWeayU+GLuPfug7SryhOe3VxQEnRe/Sx
 RMwe66hvk4Qb6gdBTdxDqYfxZNTNSIDoF6MnoDEJUX+lsdAXDS6wm0p5534yDy9hpa3QZElQwxj
 4P7oby/TZvXhzV49R/arrIMkaFdmpVmdIdz7wDMiwZw/MWcC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfXzN+6yAoFAbwl
 QMVZSA8LccyS9VDRcYtg+x/dB+IVHsRkR09IgOEwyIvHSqX6DlWzPtEoyHG0kkGqtCOg4SgpZ/Z
 FrE/+XN8XUDyhHg2BGMp0Wv6MZbOeB1iDImq89LqSeaxtbDY4td1hviNx5KP+vCRq9bxRbLCNcq
 e6NNuFnTixaH7GQbSlJBupshwENdy0L8l4bJWU9Dnzy1QyxEJ2qr3FO9kBZyLd7KWuDxznCxZEg
 lA0tGOhTRhpHkhJ7VCtYgMKFGiW+BYvwV8AWmtJerljRdd6s3ESYq8xVNAkmXgWvj/AAPyQuYnt
 kPZsD7vpakxdrYWeu/rR/OFxZh6OFlKGLfA+3AmEE+JbiwXjbnom8vb+qFZZKpICRxeOw9N5Rve
 8o+G08DP2YFCbiku6Dgen+booagOc9XepM/wZTj/Jc1TGcrRpm4cLnDabSv3ca0YUiiNByFDMkM
 J4H9/UBhT5EXSkPJpzA==
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=69dcf84c cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ic6V0yA_i5s2A4o5CdYA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: _hhOZsaghusZ-8rrNfWW2YNcMMmXBXKD
X-Proofpoint-ORIG-GUID: _hhOZsaghusZ-8rrNfWW2YNcMMmXBXKD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130138
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35108-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arduino.cc:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 981E63ED218
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sending DSI commands from the prepare() callback requires DSI link to be
up at that point. For DSI hosts is guaranteed only if the panel driver
sets the .prepare_prev_first flag. Set it to let these panels work with
the DSI hosts which don't power on the link in their .mode_set callback.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 796cc2368477..bc079b97cfb3 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -1666,6 +1666,8 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 	if (ret)
 		return ret;
 
+	jadard->panel.prepare_prev_first = true;
+
 	drm_panel_add(&jadard->panel);
 
 	mipi_dsi_set_drvdata(dsi, jadard);

-- 
2.47.3


