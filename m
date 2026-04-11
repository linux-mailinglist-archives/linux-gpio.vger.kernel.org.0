Return-Path: <linux-gpio+bounces-35033-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJu6AiE72mn0zAgAu9opvQ
	(envelope-from <linux-gpio+bounces-35033-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:14:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB7D3DFC59
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23EF130724EB
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 12:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9905C3537E4;
	Sat, 11 Apr 2026 12:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oSoou0Ef";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MhIrynSJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B392D355F5C
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909459; cv=none; b=Qx0w1UhQjyZstcBQjxQrLFxdhSvZ2tAV6FgeZVrfX/6rktkJB6gnJI7qDLdyAqtQS/3PJLbZR4HeZoox2+iDFJ441F+S53rRymwkjkmt0mHf5ftejWkZuYxIpzm2h8RntZvwaLtGF5hh5aNixMgEadqhgHCb0e6uSMIUXHlsOl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909459; c=relaxed/simple;
	bh=N8CKm/X1r0MFwLfZruus26Jh9rArudtbcfuT15AgEuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d4PLw727zefp3nMha0Fk9YuYpYghnPorbQOSq1pRTauWQ8gcuxYjkM5bNkwbdgR8qftygKjPqy0dnEyIIRy9tnKuzjrzhaJVT1e07PBi0U/+ck6LzcjU8KLJtRSQbVGic4G83Ep5hK2qDe+DQE70hRZvm0jaBPukCmDn9LIowLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oSoou0Ef; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MhIrynSJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B434cC2736607
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2x5lTfFSzhFGUpvlbYeEl+bXq1HLvTyRTgCgvYE/a3w=; b=oSoou0EfSGTd24/J
	IwuHKdflu8S1MjylbQOgCulzZKwtb7AgIVxc48XyLZ/kMjm1YFnxPlYPBo4ghrEj
	wA0OkQ+g3forAM+/eFZgac2mW9vV6ZByqC2s5KgUqFyNusaCIjzhzfN8dDUO+VKu
	TlQuo8L6MeldkwUmJVDnRv/kvUwNL6yctov3e4EGEnpMSz0hQ0/uulOPCyiAxZst
	dUyvkcGlIodgWZO6H4bII6nR85nVPYc4GlaX1hNqhg75WR87ANyl3rxAnjbQiQab
	nSZrMCB7GW0Fg4uF7mEKWyPFNKwAebRpDl8h886610WyWnwZtU4og5QsX2VNryid
	cqYzow==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexcrn0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:10:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b34223670so118742291cf.0
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 05:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909456; x=1776514256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2x5lTfFSzhFGUpvlbYeEl+bXq1HLvTyRTgCgvYE/a3w=;
        b=MhIrynSJmD9gpd00AShODcD5nJJi/EC/Tf91e1G0WxCcUt84PKVLtKHQnRO3doF+zD
         v+04ZzBgK/Ny7hVhZ3pc/hQzfwUHHFt+JHzymDfok3hGAn1QhuHb9i6BbWemUYT6pVal
         wik2e8syeiBXH1iyPfvbFKx4T7aMpbgtJMEYwoc4XRqlVbFAHSeIlSE9fvw+lY8Jf9b2
         bbRXHu0e37/Drq+RINCKq4ZVc/UnxDDmWndlLZC9SPuROtzj0geyePpg8b4YILC1lFAV
         Zokd0PmDGdnE80IUflmignm4eDGqg17v3DgkdIQds3mSf0oH+LNvLspCL4FHld5xnqA4
         f/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909456; x=1776514256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2x5lTfFSzhFGUpvlbYeEl+bXq1HLvTyRTgCgvYE/a3w=;
        b=K1bnqjo9LFqU7bYq1MjC2xuZ/C5ToHv4pyyos7ev8x2qdvSILkC8yDESGIYyQhwzMU
         F+5nXQDmUmGwtbgjmmAZbwb5kAuFjn36BH8DL/Hya7aZujoTtL0+WMqjhnBVvpD6EfJH
         dONMxKKOWIvi5N5GuNm5ScvRWF+cLKE+K70+e2vAbHN6ik4+1RMtF+eawcX0cycd+jWX
         dygulU3Dd3Ni8WXARmoFyZ7192rG0T5aktQVTqZ/40wbUxlEH20U4ge+U1CIQ+Fo4auw
         Gc7kjxA6Vj5gEHABuWgrhJKRiDLWVEFT3WU2kba8ceIGllOg1y2jFXV8hyM6iDVDmUZw
         QA+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXymoa7wp/EKYArk/0v9sr6/l5fVsYbMZ8V6Jlp0tIR/BxtCkBlrdl5LhjlIaNXJX/WvNzeUoGlqsLI@vger.kernel.org
X-Gm-Message-State: AOJu0YyYjYRZ3m8GBZTg/JimHSonpfQM25zbe5JFUcpn2hqLRWg1szBK
	aAgw0w3ux1oPKNg3y0W29BSVOt5He/SOhXkoO3BcaEUEmDciAVgx58diF3gVJrOFLcLAzy3b14j
	02ylwHPh6yLFkeYGq+84DkzcbUZ9bzIy/TGQerGFa2b0kf/vrRrBfaGxXDS1Gx7b9
X-Gm-Gg: AeBDieugyBrhllhxRiR8iD+5jhGJhwaWFznSvpmVBZP+HIT2jDE/Q7CCw9DLF9IrSld
	tGkFdobxl6F0UJKJqfSvv/DbQvpJDTjg8X2z0CFl9qY+gUoRvB7/JMaLwpP7Zq3Sncu/6jyxNkK
	wxSmFqcCaGEMoJoyPpDu7cKJZc3ROXTorTPrFgoZ7d58+YajIYFEFEdvnmX86NyQd23Gxdc57fw
	9impJd3wlE55BXgpkMP9UgcXMQFJ8OWqzu5xhJpNjqjSKHRi+kyPqEriN3+6HFGHWnn7u2nxhNu
	j2BuzDIJ00goASuu8BZ9PJ96NE5gVoZ7tlfygUqMJS5SEfcCPfas3wsj/yebaZXcQCjRzgaILRv
	ybI5Yb8tRwmlUpPeIxsSEcHm/qgk33sQxcp4Agn459f5cUxyblooSKD2lzJ5FqbMBy3kYMIwKex
	+ukUuk1CkdYTkm4QehTmp8MBsCpLEkkiogxEY=
X-Received: by 2002:a05:622a:8d0f:b0:50d:81c4:4c85 with SMTP id d75a77b69052e-50dd5cc1268mr88395411cf.36.1775909456063;
        Sat, 11 Apr 2026 05:10:56 -0700 (PDT)
X-Received: by 2002:a05:622a:8d0f:b0:50d:81c4:4c85 with SMTP id d75a77b69052e-50dd5cc1268mr88394831cf.36.1775909455668;
        Sat, 11 Apr 2026 05:10:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:10:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:23 +0300
Subject: [PATCH v2 03/21] dt-bindings: display/panel: jadard,jd9365da-h3:
 describe Waveshare panel
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-3-75cdbeac5156@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=N8CKm/X1r0MFwLfZruus26Jh9rArudtbcfuT15AgEuo=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+YtK9eEx0ut3khnZb7PE7VhEMlQFN+ww9pIp1635Owz9
 8dqtzo6GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRM3rs/8Mypx9e83f27+VT
 Xv76rX717vFL8rLFBw74rJn5yzJRbWuT8vrqJxUB2g/KGjZe2iF140auW3HpZdX/iqaMJ3n3NZx
 2iA5+23Qxqk2z1DVIo1J+0csXvgyecjJ+gXdKgp287mocqc1katK8sCpvXaVszwmLm4VLDsQXid
 46+Dt23sOMo6Zp+bpvxVhOP/c1NrPfKRgpoOgm9U3r6T4hFpWJC9T3uk4qszxTXrR7u+y7VfIhM
 u7h2paCl6Ib10526PNhNl5y4zSb8m4xljodbfODEnJ/CrqXHX5SMX1Zr5t4d8uvil8s4gYaJUYf
 ai9XdEcZeAX5xi0O3Vfj+u+6+LO4+qKHwUoHdF6ozPkMAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfXz9aC70Sjtx2r
 lcmdzu6zQY7Q5cpgdD42rTkIKO6/P/x3sZro8WmHn9QPX7dR/+GVg4H80sphq3akl2VTcR6/xJQ
 cBT7t4VxoqMYjvdpffIZT70x+ZOunadsRuYPvo4cFVPIZQ49iudFMaP910bEJQAgrww1j6Ueumq
 pc/YCsvp7lc35kz2EKI2Ey7eMEU6gG+dS8EecJHl5/xVzxFjNXgmnl8Dr9nI+waMmbFCfKUz5Uw
 lG8YfI7h7YpKnqEdO/C7TcPj5UqvjNjTtcsck9iMnbcKUn/9AKawHwDaSNeNJvWIwDIlqTcmF0m
 RYZxPlvTt1kfzfqFdCwHZqkoExmIG2NwaK3fi8ph+nSV4yxe4nC3BiW5BBWedFbXXKiwbh/0OG6
 szg3iPqZpziJw0n6hCfTkwsOd/SzsJG6Q12+vd7LsBOpFE6jnlvJ0rqzMW9XTR/5jRdEseX+rSM
 22KRHWcMblOJAn5Js+w==
X-Proofpoint-GUID: -joGWoxNBLuaAvXpGScfzUiYwv0JwZqy
X-Authority-Analysis: v=2.4 cv=MqliLWae c=1 sm=1 tr=0 ts=69da3a50 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=3ozaZGYpt45I3yT0zMEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: -joGWoxNBLuaAvXpGScfzUiYwv0JwZqy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110102
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35033-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 5DB7D3DFC59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Describe Waveshare DSI panels which use JD9365 as a panel controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
index e39efb44ed42..4eae802de9fd 100644
--- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -24,6 +24,12 @@ properties:
           - radxa,display-10hd-ad001
           - radxa,display-8hd-ad002
           - taiguanck,xti05101-01a
+          - waveshare,3.4-dsi-touch-c
+          - waveshare,4.0-dsi-touch-c
+          - waveshare,8.0-dsi-touch-a
+          - waveshare,9.0-dsi-touch-b
+          - waveshare,10.1-dsi-touch-a
+          - waveshare,10.1-dsi-touch-b
       - const: jadard,jd9365da-h3
 
   reg:

-- 
2.47.3


