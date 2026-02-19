Return-Path: <linux-gpio+bounces-31846-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAxJFm3PlmkZoQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31846-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 09:53:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C611E15D1FE
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 09:53:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16C36302C32E
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 08:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BEEF3375DC;
	Thu, 19 Feb 2026 08:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6wJF5X0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NMytQyae"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AB433344A
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 08:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771491171; cv=none; b=PKSt6Vm/AlgiWppYScz2RQzbgq0wnClMfxyn7QM43IHcwqh5XYLxe/UDQ3O0+Q+GTdAKiVG8wFru6W4kAhhrJnWmkdiY12jfn4ECKCPJTe2l4pF/IOWBKEXqKhjhoE/bQdegAhOos8SMG7cpRDkqqOe/WkmkcG5UoDB2nstzIfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771491171; c=relaxed/simple;
	bh=09gU6eYkuiNszHVCfyUAUArctBsD8+KpisRbnCS/ePs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=I+3e+klf6rh5n+fqlygUb444UlyAsLw31dw1pRYqlLlMwjS7JZzy+AfWN6dZ54moYJ+Kwm3hI3NIrjlXA4yfwP+BY5f1imo4t7I2PZhBc4U9e0CfUdYW3vm/QBCo7BZSEaJ9r8UggUc360087+8JqgJ+Opmwm/juNB0y5STmHpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6wJF5X0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NMytQyae; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IKxaHe3133082
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 08:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/VJQk/scXTP44mikF6XflK
	jjFdIUKAbgXlXqn6UgLBI=; b=Q6wJF5X0qNmVatB87u44QNkD1WEeRqXjDFoZ90
	J7BZiaAA+15fvvrTId7+ZXVZ1q0QA+Ge77a2LawnJGX0d7n+khZucJlkLQnETkT3
	PW0emm4A3zQF0ioqrkYCiE74LPAs5CMjr/jfcgt+3EZM1GpsaVYlKCIs5wCT15Xr
	eblYvzKcDZ8EkeFRwpST8Teln1hKKbyqOEvbeM4NzrUXtl6+7o0A14jBwGk5cXaU
	9tFfkB2iWi3+EnKHL/dxMN89ze/oXAx74wI7ZcRUBEnVEW71Xn/JosRUM/oMPBis
	BqtrfDGq5O7Cvmnft0lif/I+kyU5W1TziaSN6rm2OxI6eEOQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdmxvsd1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 08:52:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb37db8b79so958537685a.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 00:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771491167; x=1772095967; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/VJQk/scXTP44mikF6XflKjjFdIUKAbgXlXqn6UgLBI=;
        b=NMytQyaelWmfaid2oY3qaq+GMRAizpbTZP6Ug8qASsnryF/hr940nA5aUjTmc4BNia
         0Y5u0cwrUvhy1hRpRoC8948OJjkiwLrEjNEIbvGH9O6y+SrR9y0bW21px7BOPnZenRmc
         +JQYzUoNXBcaSzsQRjdK7nMsplG/LrUZYSxc+kp5UYFi2LGfUjD5G8ii77Ifo2iTraPi
         lNolDm2pDafFPK8kjks5MwSE/CzsEhqa3bGR3Q6IzjBEpmf3xiLBDLDg71aihSjOdJNY
         UQMwJoWd4yT0wip8XtWeZgCuAsCJwI/4o5Tfg7bjaJiuhJn/+AVj9ydsL1X/jBxvTq37
         SeKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771491167; x=1772095967;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VJQk/scXTP44mikF6XflKjjFdIUKAbgXlXqn6UgLBI=;
        b=TRnM7HNfWo0VwNgXX16BRlSTWKrSeO/Cq8nEiUw6wksGiqV31BA3n2MogB8cMtHEtG
         411F03eBfUVZU4SkMZCX+4d1Wz3CUSWJX4MO4EI67lemesVJu5n98mUbO2SZiCMQ36sS
         2dzN/zEbZ81WuVWrY++ZbEl6a64lly45XMV2YCrhXjhysoKWGVVeb8hvWR9kwveRNGFE
         t+37lsxgF6wxCkTa8A5YWkUt9pe6j31ijAUgRCcfPreX4ulJKWyXRycMUwJU7AugR3rS
         cYFjfrB11dttINpRKkcX7sTn3eZVVtpqlMHcewBjccMm2WNEwsa+kLWuOSXzUCaheg4J
         2qcw==
X-Gm-Message-State: AOJu0YxhpO8DKhO0P/5FaBV5VPAS/carrQ312RPMYCx7Fllqz/cna8eK
	tWnlp+9MW6lMj2GG/kJSRFrjAK7g0CBoGzHDC/HQiihQ2fZEBzNVPmXjlojl2a9TqpEQb6U1fLV
	FAQyzNxITsUmYQuA25RwrcR5aONRzVUzk8cYzmcEXU/HOHg/qbJ9d8ErhSCiC4sKc
X-Gm-Gg: AZuq6aLZEOMldIanpMyjBpzuWBwLZk6ugiKBT9pVvDKEDcw3if20HGO421sWCPz1sNe
	Ye0NFsX3CsEACJe72A5jwDqtdscN4eAR8ZNJmFh7EIAMKe3NWj1Zj1EhLAyoYL8NfW4TmKao+l6
	Q82dgwp6lLmq02cit0vMLNwftg4tjsNXKw+WJHgeSXDgjo9NZ5N9tLjTvG9h+tjqvb8Z8YuZgTm
	508XuLOSgKOu7LF1keaC/E1oVF0e7ZYfU0D7vXdBFQlJ1UUXH8ShVnsU0Ee/NnhNapzQuXEWN+/
	PszpysYJO4x7v3pof5EYgBPryWcXKpWJGy8rtsgkklbTzzwxwpISUTgJBM2F/5IMnHTRTT/Jx38
	wlH355/85yeRQhCyYgBGdWfnDAamor52+Zp2T32LhaBajyZjeMc4p
X-Received: by 2002:a05:620a:28cb:b0:89f:7109:185f with SMTP id af79cd13be357-8cb4bf97d9cmr2049958585a.31.1771491167525;
        Thu, 19 Feb 2026 00:52:47 -0800 (PST)
X-Received: by 2002:a05:620a:28cb:b0:89f:7109:185f with SMTP id af79cd13be357-8cb4bf97d9cmr2049956985a.31.1771491167011;
        Thu, 19 Feb 2026 00:52:47 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:acca:9ed8:5af5:752a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac82f7sm52117586f8f.28.2026.02.19.00.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 00:52:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 09:52:37 +0100
Subject: [PATCH] gpiolib: normalize the return value of gc->set() on behalf
 of buggy drivers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-gpiolib-set-normalize-v1-1-f0d53a009db4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFTPlmkC/x3MQQqDMBBG4avIrDuQiSDWq5Qu0vprB2IiSRFRc
 neDy2/x3kkZSZFpaE5K2DRrDBXyaOj7c2EG61hN1tjOWHnyvGr0+uGMP4eYFuf1AIvpDSxGJ9J
 SbdeESff7+3qXcgGAm4fdZwAAAA==
X-Change-ID: 20260219-gpiolib-set-normalize-1080e2eda113
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1562;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=09gU6eYkuiNszHVCfyUAUArctBsD8+KpisRbnCS/ePs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpls9YCrYq+MBw551UH2DxaXRDZuvIz+Gg7XpOB
 f+QIr4zgyWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZbPWAAKCRAFnS7L/zaE
 w8YYD/0f5lH0fGRHlj2gijMOC7ykBATjU72sWmTFhsD41QqUN7LOqabeln+3ImOGAL7yNlKhtet
 YtOQioU3/bMgYFj+fjhzbzzgRk9f5N4T5Kb+E6/tlNwkczLELZArtxrHojZuszr94Ho1dqhS97u
 hbdT5B50NnST+S5vErrE13BfCavx/U/cx6jb3zhFr2Qd2e5uuPdm0bfsm9OpBqxuC236YwdSs0G
 Q6xXglhiU+FHK+A0nZjd8yAK92F9En1qbng270gyrtjyqK96Pn0fjwSwnBqEJlgajWH/lpZLRbM
 OL/MTRiU74zWtbBLLZ/aZFr7aQ4TsMTj16PkV9JvGkuj7JvDyhXV76PLoBy2VYIPWGXqf3CwYq0
 jpqNm37o0qOuN+s6eCO8dPkpUvgclZ0cUtmAdPflWYxTa9DKrz4Zgb4/0HA8w+s2MEKIsE7Js0K
 JJX9TAshJjVIzNhXDorsl9Xq49KcfSSwKFB/ykZsVMDWzNGEz2rKW8t8i1ypFyuhS9GP4QTbbrN
 jVvQDgbtjZP75Bx6yFGBN+EPJ75obXdjI7A9HFTpqBlfF73gnpDPs4srlho+P1/JpJbpFoXD5lz
 sG6xfw5pohCsLaEFEkF11fClIDp2jKX0MQcluhipC03UNs7riO4twW9GZYKC5KtHYGKTdjzi8gu
 K/Tpqbmrvr3uAJA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 0-8xM2jKD3W-qVmmgLwPMVDPFHR51pmZ
X-Proofpoint-ORIG-GUID: 0-8xM2jKD3W-qVmmgLwPMVDPFHR51pmZ
X-Authority-Analysis: v=2.4 cv=XpX3+FF9 c=1 sm=1 tr=0 ts=6996cf60 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=67SJ3es6nUsVzo6b:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=Km6uTPIqCEU1mvpJHkcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA4MCBTYWx0ZWRfX0ytAHVWpqztj
 KMCtckcFyspDPw7NEbx6YFpUFcXJcO+k6ruET9TOKuTHKSnqAYBR/41tzVHSaKH6k7i+BqPDCcZ
 YBnlegyAjxZ3mwos/vPiyyt0oaTWLV+OVKq6wPp7groYbxMauSI3Kyo1XztsflMdvxw39nl/URl
 AZF3LAAjohLDje/b+ENop5VjC9jCRAIE2bE2ipaLjp0lZ5ElEgZr5kDR4/Fa10c8GvcGvLeETGN
 N6LzvDgR0u/YRnTfDxdR3cKsFUemh1SCYtSJ6QFLlNqRpPlKP8scUq4QHsdyxy1WrdFACKbsZ4a
 SbM+Z0tCkMdUI0b5I+Mk05sx+Y9q+x+0OwchnXHkhL3l9C2LZFCYXy7N+7O+00+VMlkLV2qcnI+
 /mpM4mAc5/x8TOlh1YG0ZJQvc0qrqjBjaPy+kLrHCJZTlc5VMgHAlAv1gQVCFh41uIQJU4s3HPz
 eFt1A/YhZFu+63yG5Yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_02,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190080
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-31846-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C611E15D1FE
X-Rspamd-Action: no action

Commit 86ef402d805d ("gpiolib: sanitize the return value of
gpio_chip::get()") started checking the return value of the .set()
callback in struct gpio_chip. Now - almost a year later - it turns out
that there are quite a few drivers in tree that can break with this
change. Partially revert it: normalize the return value in GPIO core but
also emit a warning.

Cc: stable@vger.kernel.org
Fixes: 86ef402d805d ("gpiolib: sanitize the return value of gpio_chip::get()")
Reported-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Closes: https://lore.kernel.org/all/aZSkqGTqMp_57qC7@google.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c52200eaaaff82b12f22dd1ee8459bdd8ec10d81..9f7a1a1ebd8365fe933c989caf9e8c544fd9ba0f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2914,8 +2914,12 @@ static int gpiochip_set(struct gpio_chip *gc, unsigned int offset, int value)
 		return -EOPNOTSUPP;
 
 	ret = gc->set(gc, offset, value);
-	if (ret > 0)
-		ret = -EBADE;
+	if (ret > 0) {
+		gpiochip_warn(gc,
+			"invalid return value from gc->set(): %d, consider fixing the driver\n",
+			ret);
+		ret = !!ret;
+	}
 
 	return ret;
 }

---
base-commit: 50f68cc7be0a2cbf54d8f6aaf17df32fb01acc3f
change-id: 20260219-gpiolib-set-normalize-1080e2eda113

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


