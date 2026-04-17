Return-Path: <linux-gpio+bounces-35221-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIeJLjTC4mny9wAAu9opvQ
	(envelope-from <linux-gpio+bounces-35221-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Apr 2026 01:28:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 109E441F2A2
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Apr 2026 01:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8324730A626B
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 23:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40AED37F8DF;
	Fri, 17 Apr 2026 23:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EKfs5IuE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sdz4JUp6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E7537F8BC
	for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2026 23:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776467800; cv=none; b=LRNKi7QQyI3slG0kA2fEzBlGXKIVsImbjoIixoNlGTYWFPdWNH8+GPQkoczAobXosGVmTqQH4ejAALUf4ACfhq3USYBzK1HbBVOQbbZMLxTy54A238lZpRs7/iaKn7Br+SjGIy6MSDND62fyXV4d8eqIwR4kBgCgh6KK1s4TyGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776467800; c=relaxed/simple;
	bh=QFyGUBjpv4MqdXiM8mWmHDArDsRkJpFYDlFfKXrJ+qM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tNRc/6OuX8C4yLXaN6jJ0r+qr7YX5kmKs1PGYlhtwncCxQ/JoetPxmwpg5f1ihbyWVdVRAe3gkyOTbJaIzmlu5ugUFDmR3wrOzcDESrNgvJrTNvKWBk4uLZ9IrnrcgM2DQ4mlhP8bbdqggH+RPiV3xDT1ktLd2+m/Ln9sRbcpHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EKfs5IuE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sdz4JUp6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4AZj3929276
	for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2026 23:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k/MReTiZ3YyWJtzTaefEwes+g38rRRobC1lXjVxZm/g=; b=EKfs5IuEqeYFGoiH
	VpEIJMmAG6oQaB5BWZ+EBd67Afhq/3BWr5T7r4KpAlw+ChVQGry36vHXnztX1glq
	s5zrcMXHC0p8fVoIuHPXqXq0eoOSLtQql50DMgH5bm0aLBS3cL/AK5nYDr71sTNR
	/hJ2q6kqfjaR7vEWFTNgz5R9LZtBYjpD+Ra8uGq48qisCmZLsnLWQR0MR0jIkKIm
	Q94qGYAAKNq8LtKnqfAZvK+QhBxkzC2KMqEFds8lze/eXvYjzzpuiSBymc4hmNH2
	0/D2DoTnzZ5nSrqE1yZKafELNlkp51PptJ0R9ZWT1qgChWlB75sKWTyG9FBjDl48
	aBod3Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkqujh4v5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2026 23:16:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4076dc16so21470101cf.2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2026 16:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776467797; x=1777072597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/MReTiZ3YyWJtzTaefEwes+g38rRRobC1lXjVxZm/g=;
        b=Sdz4JUp6QQvmDgH462bEt6X1wptPpubfaBQzPyAo7RTm9TchMau1mOh5P27MA/lWJp
         QvkfiMUBhbQwgOunT72WNqSFjBaWDvT24MFoOQaD7bvy4vO/yebpw7xPuN69HpvhRzob
         HhClOtsQ4gyMTkpvc+6az+IEmW5S3qq22QAAv5Nh4lLUdaZtSwrv+ZdXPMNiq5bGzCYR
         xmfz5EYE8EQkm8C5Y667s1sHklXoew8JVncR7O3AE1QbUnv2urAsWB0tyNDz98ordRTa
         8PRX7fIWDJEmK2qwCmDOKlkjkl6HrgRiwuYOsZxwa+TIs/ZtmbcxPqkKxr4yZa8073nY
         OoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776467797; x=1777072597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k/MReTiZ3YyWJtzTaefEwes+g38rRRobC1lXjVxZm/g=;
        b=FTjbzaVZOQ3WDt/GuAARRMqLF/lPEURMR5N7iDkvIlOq71rug+K64DOfMgIbSrZt9m
         EHbKquzaIWpXktbu6D7uHYbwQt+Cs4kNR7JAHADPyVQG64vy+o80MOjJUFX+9OHJGQp/
         /gXs3l6LIwrncz42e8+Pr+Eh9xg9Qzq2GiidQMnbDWH5BKdtQY594cCr/qGBO/CZ8JRb
         c7FqDBSQkye7p0JI6velZMcmQ6ckX0zbQRPiKeMJSlsxKkLk9qdGpywL90oP6Mz6VfJO
         grALXUhBFJa9HuhRTzEqurXL8lmGFceohXewSZwR/netuLAeqkVt1TxnywK8ITiQITaw
         FemA==
X-Forwarded-Encrypted: i=1; AFNElJ/XAnJUv2RAz+Ham5LkAUCeqxnLPOzS3+JvNqeszMrJuA5uYfDrGH1PRBtSQV3w2ci+DBcqoKgXPqH+@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbmsp2zAyN2uf9Y62FXtsCnD0nIVrusRmhaklYFSy+6cZy05KC
	AYlaG1qdVbrwujLRpb+HAVxR+M8uQ2QezB0Kzi5LPigKR2sJaqOjTEpsxE/+l5g8HVt1RmvFlAl
	rS8frfB05v3R/RHl90hOEFYijuqIUBNdXgryrYMVxipD7siOzJ2cwkqDeK/JrAMYE
X-Gm-Gg: AeBDiet/4azVvVlWd/H9bnAqYGM6kuFgW1+XfPpEWbTCOfrVTeBkCW1CoHmDgxxTHZM
	Fy4E1sEe9kzOKIKPD0hzdxPjSUirS3dswFWn7QvXhGTT+IJQS9DsKo+gRHEiNqHkphkGdUnt8Is
	RceJ2mCiBXSroOpm2gJIn1QMFpMNUDU+babBwZoA6BncxhbhPYBb24Q7f0PpiOGHKT4RJ1jseM1
	jcvcntbqWA9LAezRI1mGKaGNvIXV1fm4bP8xecIbOcI+ULK+JGp+CEr3ymuo3w/gjPrm7oeVufx
	L7UHtOwQZ2aboEVR3SPFggzriOeL58hZtqv/MiMIwFp5P81vNbKkmm8m7yZRQTgt0y7q6++Meej
	AEkSe00awxtKlDV9J7Kp/UwSRa/9zQIIcIZO6jOkJd1noGrn4dyv1uLK4c9sIgPZNsdx8/HfeTO
	r0r16a58lj9S8QWnnRdYnaRG2m/3rvlDnxZHbhhuYeN4yXcg==
X-Received: by 2002:ac8:7f16:0:b0:50d:7135:5631 with SMTP id d75a77b69052e-50e368281ecmr75066931cf.6.1776467796876;
        Fri, 17 Apr 2026 16:16:36 -0700 (PDT)
X-Received: by 2002:ac8:7f16:0:b0:50d:7135:5631 with SMTP id d75a77b69052e-50e368281ecmr75066231cf.6.1776467796412;
        Fri, 17 Apr 2026 16:16:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad12asm815695e87.1.2026.04.17.16.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:16:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 18 Apr 2026 02:16:22 +0300
Subject: [PATCH v4 3/4] dt-bindings: gpio: describe Waveshare GPIO
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260418-waveshare-dsi-touch-v4-3-b249f3e702bd@oss.qualcomm.com>
References: <20260418-waveshare-dsi-touch-v4-0-b249f3e702bd@oss.qualcomm.com>
In-Reply-To: <20260418-waveshare-dsi-touch-v4-0-b249f3e702bd@oss.qualcomm.com>
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
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3635;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QFyGUBjpv4MqdXiM8mWmHDArDsRkJpFYDlFfKXrJ+qM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp4r9Iv5xhufaEtYkC6QvNv+yB79Xjg8tcucfbU
 GPpWXq7U4GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeK/SAAKCRCLPIo+Aiko
 1QZdB/0Xirv0hja+h/Eg/Im/1sajcD2PL4HsG86Wjhg1rSgIoZlF5In2wlN4qEL4vWYsVMEttQa
 GuVRQfn8ZmQgIZeL3X4omDRYw6THCiyRf//j2VpVlrsYVGVpe91zhd380Lu5MNeZC9CXgkXs76W
 mmvX/I3QVYVICneKBYxiBtOF3VPi54RApWS6/vFWw7rCXV3tw+OCLlcvtBrbKoy6d8bDzt7nLNF
 Qwtaevb2ikOh2d3QaLzFVSluoYI6Ji6Ah8ZfvbYx9BlsAmyy1Kj3pn3vntdMLjoxOkZIvC4N1Vz
 Z8py20gICNPtXnkD1WNp8bLxJoK+9Kk9HJjA6hLvEkFZkK/i
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzMCBTYWx0ZWRfX2S5JC0lg3OPX
 nOGl984fE7shyDwM6RJ/CjGUzadWoCprTJ4G0O1SrIEEZNLKRKA2/T7IwfdxYl+9PEfRyIcfLeB
 f1S0NA6e7IkVPI/K+ET+uzgPAfIFYQ+AvACswZYsZr6q7WbbWU8pqgle2i8/DTOCXdVbajJZ3OD
 zMdv4TJwLIIcKGfzhhw3l9jUMNfFxLyCJvw/RlNTAU63kxw0pmBWvbHHQxEDxyGSnqj9IE1BENg
 UjW7PSgcPEPB8z1jGGopqhCl7U3CsgTLasrGWqjX7QkOdX6iRkXF08UOEx0jOPVvCQswui7i+P6
 8EtKlOye5lLjN3elx82tx7BrprG/VokUPGN0mAPDkZ31Q7Nx1JPQZlmCiD6vPQVg94ewUryAxTI
 Bx2vBi+Yqu+XpXaRbaUOitQHGB4gfvRsn6xAg+qSBHeyFezSxUUHq0QZIhJ47IEeodab1oQ9O3P
 82O83eyeqVBJ7V8nrWQ==
X-Proofpoint-ORIG-GUID: vvqsE-3rPrfEHIThEZb5EstmbL9rORGT
X-Authority-Analysis: v=2.4 cv=FP0rAeos c=1 sm=1 tr=0 ts=69e2bf55 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8
 a=XYAwZIGsAAAA:8 a=EUspDBNiAAAA:8 a=ClTKKeZw4Bcbv9k5X4IA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: vvqsE-3rPrfEHIThEZb5EstmbL9rORGT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170230
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email,devicetree.org:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.0:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35221-lists,linux-gpio=lfdr.de];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[24];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_SPAM(0.00)[0.974];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.45:email];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 109E441F2A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Waveshare DSI TOUCH family of panels has separate on-board GPIO
controller, which controls power supplies to the panel and the touch
screen and provides reset pins for both the panel and the touchscreen.
Also it provides a simple PWM controller for panel backlight.

Add bindings for these GPIO controllers. As overall integration might be
not very obvious (and it differs significantly from the bindings used by
the original drivers), provide complete example with the on-board
regulators and the DSI panel.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/gpio/waveshare,dsi-touch-gpio.yaml    | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.yaml b/Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.yaml
new file mode 100644
index 000000000000..410348fcda25
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/waveshare,dsi-touch-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Waveshare GPIO controller on DSI TOUCH panels
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+
+description:
+  Waveshare DSI TOUCH panel kits contain separate GPIO controller for toggling
+  power supplies and panel / touchscreen resets.
+
+properties:
+  compatible:
+    const: waveshare,dsi-touch-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        wsgpio: gpio@45 {
+            compatible = "waveshare,dsi-touch-gpio";
+            reg = <0x45>;
+            gpio-controller;
+            #gpio-cells = <2>;
+        };
+    };
+
+    panel_avdd: regulator-panel-avdd {
+        compatible = "regulator-fixed";
+        regulator-name = "panel-avdd";
+        gpios = <&wsgpio 0 GPIO_ACTIVE_HIGH>;
+        enable-active-high;
+    };
+
+    panel_iovcc: regulator-panel-iovcc {
+        compatible = "regulator-fixed";
+        regulator-name = "panel-iovcc";
+        gpios = <&wsgpio 4 GPIO_ACTIVE_HIGH>;
+        enable-active-high;
+    };
+
+    panel_vcc: regulator-panel-vcc {
+        compatible = "regulator-fixed";
+        regulator-name = "panel-vcc";
+        gpios = <&wsgpio 8 GPIO_ACTIVE_HIGH>;
+        enable-active-high;
+        regulator-always-on;
+    };
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            reg = <0>;
+            compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
+            reset-gpios = <&wsgpio 1 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&panel_avdd>;
+            vccio-supply = <&panel_iovcc>;
+            backlight = <&wsgpio>;
+
+            port {
+                  panel_in: endpoint {
+                      remote-endpoint = <&dsi_out>;
+                  };
+            };
+        };
+
+        port {
+            dsi_out: endpoint {
+                data-lanes = <0 1 2 3>;
+                remote-endpoint = <&panel_in>;
+            };
+        };
+    };
+...

-- 
2.47.3


