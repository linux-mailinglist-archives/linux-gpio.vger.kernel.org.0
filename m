Return-Path: <linux-gpio+bounces-31870-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIcwB/c6l2l2vwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31870-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 17:31:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 340C6160B1F
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 17:31:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A6E20300C540
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 16:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A7534D3AA;
	Thu, 19 Feb 2026 16:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iatMQV/g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jtil4Y3n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF6F34CFAE
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 16:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771518700; cv=none; b=AtT+BGBrmOtT73MjyRsMKPBGi6qfUCydDp0wTZAw7wHg30Tr1d5B/J5EDUvE1IsDtitgbJmM6ldUL6SHD6qWiLRx6xf3OQSuvtZd6rRLuAiMs/uLk59JtMZOfisE58uEU055qn7J5/mIppema4vEz8eGRno1MldaM6vRcOHN7uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771518700; c=relaxed/simple;
	bh=A+Wvx+Ty20nDfCj4YJNHGDJvu7T3n9RIyhzQMaq8B2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gr5CD9YpPcfFJSjVNvmWSLiUl0aZhhITgf2tmwoDfyJH0/I0vZBIjumcIF1Xj03mfNdPGUI3hwKhS5Eq3Q+V/Xi7PCAd2jcVCAuycLzp3MmlWGUmQ2YpxJudajWNlQjmr0iZ8+p8TCY8W/15DjpQUoOYDE6tGf+OJuSj3iqEknc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iatMQV/g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jtil4Y3n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JCJQ2c2885457
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 16:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ABYrK652LfiFcuUIPwfxfXf601qOkzps6FWpqFe+6bo=; b=iatMQV/gdpmIJ65m
	0EgeOXQ+n9QK8nBgOuLi8uWVVSOXWLFvvfPuAgM2qQkDz06D0Op+FRk65MAdM6RC
	7BfzyUTW+OgXZbxoDBPKTlMYkBFJwmIzJZaeBwMaRZk45WTx3aVqKIikolPG1t9v
	bzxiSsGp4fIDsiILQRHouC45X2SOBlvDmATi0X8w8YGJvlKXv9YmM2aavfLXRD8m
	twrQOFXA0XxkirEEC2ZQL7RFP1CrrUmaQ9EDpG+grac2SlER1v97RgjQwhp5TY7Q
	MNUPq8TxbwfyoSp7117qEZ2tIE39NZfahPcm8oLWVbFSTr9/d5HUk2Kc7zr8ixGB
	kK0izg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdqfga9vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 16:31:37 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5fde8914fccso1305284137.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 08:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771518697; x=1772123497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ABYrK652LfiFcuUIPwfxfXf601qOkzps6FWpqFe+6bo=;
        b=Jtil4Y3nENun2KrjE6KzZSTCUXJygtdWS5wJ57K9qkMIaCLIvK7odQ41g4O1su8yWO
         qJSSBa8i9anROe8nq705HT28kRRYteXut23F918sfYk90KEiV1xFCM4qxWZEVxXtTAbJ
         KZ0SupUmT6xXOVi2FrjDPWz/Z/A5y+2C0zAUV8C17t5ZFsmlsQFQRslLZU3LZiwIlfNX
         4N98N/6kLSGyIIveEAqHbERqglUcSmfiLJl8Szei637tnW7dtcmdu0FvTAHMV1TLxLDL
         rd1D+Ro3QrQAI6gvFOMicgsmBRVnVHWXm9bZpdJXt1RqooDx+vtohU7UC0Z4PAvKq9Xv
         G3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771518697; x=1772123497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ABYrK652LfiFcuUIPwfxfXf601qOkzps6FWpqFe+6bo=;
        b=xMIAzp3oPTROauUb+SdGBq7x4UjeA9GZKklmURb7daiHHcc4xQdOAy87WU25eddYl9
         ATf8Cp5pdSz/ub4sfmjGI4nDjX+GBDPjNIrW2FQfzDEheKdvNOLsAy6wTqU450sy3eEo
         XQK/W2YFeAwh1RGq9LVh7rkJGrPtsNhK1mIWlec+tCcqYgLk0I6kJHFbJ1jguOa+e+ls
         buusPUCM5ACnGaVh8DozNBqdD+s6ZUNy/uaAJyyg5POMpRByWMNLSaMd5VhfsdCJiE+H
         Jh8sLY3EmvJ3RvfXl+2us+5RhGVqyHHLpPfbgpRkKi3DhhGR39qusAZ7ETd/651n6Ij5
         2tgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGFoAuewaZIbVCMB2oFwUj7cKQBpt5YM8tTD8rLuOIZF0vvhWN2sw5oJZwVaN0VahpQHWx+XSfRiwR@vger.kernel.org
X-Gm-Message-State: AOJu0YxQwPJXIEgUgWhI2cMoWJaJjLZl7YdoJQuhPIxRvfdimSxxAy34
	yuy/YaH7q7wYSAv3kNaxa2zlv7c3ilS141h5bFLbMrn338qRA6bJdTO/y+s4779B5y9HW8hEuA2
	jfjlRt2Zp0kEN092OPg0WFBeFLMY87+A2Xk+fzw1r2S+VHuVqny+XitBgxQflUqfP
X-Gm-Gg: AZuq6aJiOYB9efarwaunWFHCjRnKabhzhxoBwUr0BtZ3rToP/UYdyjojIVoqIXimMqJ
	rOK1nK+Ny8uFlVyPXMyiBdkNOdT6QRggHg7tMmS9auMMVrNlpZC9ta4APGRX44Zj0/jTYFxN81B
	qhcR46iyP6XTlY+jYKWuYkdwpHz5UgrXuQIOhanmJ7UgTRnQ30adabxWOcNkupJC8mU9GAYZiaj
	5kK52b5Vzj6U3uVDIfzSTvfeNf2x1jQf4Oce9LohmRDNf1bydQ9rHJ8L1nUm0jtvFTdgXfom41F
	TYR0RbtfPaUOthdzLvMAhohi3D35bHjpcIZVCZK+Zfq6yY7/CmJzbiOJTo5GWKXrqoAuAPON7ig
	IIoq18QEq6w86X9laBg8a/VyQ+9sKMLAM8UavCUPCtd76ssEKN7IA
X-Received: by 2002:a05:6102:2913:b0:5f5:2638:9f3f with SMTP id ada2fe7eead31-5fe16c0367amr7758235137.8.1771518696161;
        Thu, 19 Feb 2026 08:31:36 -0800 (PST)
X-Received: by 2002:a05:6102:2913:b0:5f5:2638:9f3f with SMTP id ada2fe7eead31-5fe16c0367amr7758139137.8.1771518695481;
        Thu, 19 Feb 2026 08:31:35 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bfd6:96b4:947a:52ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c56d8sm20272365e9.8.2026.02.19.08.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 08:31:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 17:31:22 +0100
Subject: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com>
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
In-Reply-To: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=A+Wvx+Ty20nDfCj4YJNHGDJvu7T3n9RIyhzQMaq8B2c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBplzrgzLcXpABDe6dzdVFnbsyGtIt/+ASW7D7lf
 /JKGdeK8oGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZc64AAKCRAFnS7L/zaE
 wyJ9D/oDrLGviOsBuke64wEQOu4gSFHPmXghPeKN28Fvjr+J/ib9T8R2Z+UlVXNO05AsA2XsrHk
 lZ4Ser3QjGx7lQA+TjMjKJEjgwNnQ3bDUmASVz6DfHFJHSJVRKluFQ0fFuyEAZBUZCnrHhLP3lO
 n0mKUXDKkjBRugAHBGZC4x03IcIm2PDSKycF9xnxuBgtZY8zJQNyi+sRc3k+qTgz+L+g4qFA5WM
 yFL37AQ1yzs0CWtGTKcFNs2azfMz4yCuMXYAgdnJVhALMSC91XwrBk5vdImd9QPeNq64y59/lb9
 sszV/07PZDA/8wjNPiW0fdw++54Ca09Cx92Bhzw8nn900ZcsIIM1stwMFjT4+U2k3jrg1Dfr/4y
 Ibj0UVnj3Wamf1JNkWYZdtSblPjP814RH7728Xy6kMsfRtLHXLsiOz99p9pXu2AGqQjHbncuXIx
 8ft/suh61IkjFWgN1b8v1MSc34IH+UX4xvt52ZgRA0XaiYz2XkzCKGZJKBD+Hq3vbjlzSFp1kWL
 53xla3ibtcVgsZ4WxZIp1pVJVm9xyR5dArzjV0Oi54Ypl+Mna8zE+CyPXwJeKO1pPa+kSlmtdu5
 3po0s46e1JyGia9r+W8bjguRnOjIGhqko0Yc1pfBn5sVD+HqJCVbJ7RwxVufkDyQsN5v8zTtFMy
 iQfL26OBm0PIPAA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: vsMtocnWdykw0X6DDKW4dNBUXUtHN9C1
X-Proofpoint-ORIG-GUID: vsMtocnWdykw0X6DDKW4dNBUXUtHN9C1
X-Authority-Analysis: v=2.4 cv=A6hh/qWG c=1 sm=1 tr=0 ts=69973ae9 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=DAUEkVzOf6JpX_SNRGwA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE0OSBTYWx0ZWRfX/lZGC10brYmk
 i06BszaQcXFCWCfAP/QAkwFSXb2PmZVox1DlEUfA+KoG7TqjA5G3nR+CU1h9VyRCQwmLyy2MLAf
 kb5XiZFSLceAtqDrisHakwPcE1ZBJpN7y2Z/mAmS8HNHBCKaKi9t2K/E49ZkoTW1+GND+mzJQfR
 zntnZmG93w+eYdHa2gGoZCRX7BUXujQnUFFfYRD2PJ3bwdvAkI1V2KALQUuEK5tsXSayHVdXO1e
 KcxaNErqyYdg0ipJOOn82+MLkSjOi2V5mLWg2mCNCGM14CScSDaXb4D3OcKIhxcGcMfRCMtXQ6x
 7MEgmGyTecMPIPA/ytgpD5qrgAv2lkUPQKhtVYdujY8NqzRF6AY7X0JLu2anuA//YG83gHw8rwx
 A3ttBemTcBvtQvcGTaMVQD8nuSP7ZGYI1Nrfp/vhOYidjQ6aWiNzxJd7RZ+ZdvHP67+uGdmbNx/
 Nc9a3dZOXQATFZiKKdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190149
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-31870-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 340C6160B1F
X-Rspamd-Action: no action

Provide an extended variant of device_match_fwnode() that also tries to
match the device's secondary fwnode.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/core.c        | 14 ++++++++++++++
 include/linux/device/bus.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index f599a1384eec90c104601422b04dc2b4c19d4382..bbf1337978fafc35eb94bda85e0bb7f6879879c0 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -5326,6 +5326,20 @@ int device_match_fwnode(struct device *dev, const void *fwnode)
 }
 EXPORT_SYMBOL_GPL(device_match_fwnode);
 
+int device_match_fwnode_ext(struct device *dev, const void *fwnode)
+{
+	struct fwnode_handle *dev_node = dev_fwnode(dev);
+
+	if (!fwnode)
+		return 0;
+
+	if (dev_node == fwnode)
+		return 1;
+
+	return fwnode_is_primary(dev_node) && dev_node->secondary == fwnode;
+}
+EXPORT_SYMBOL_GPL(device_match_fwnode_ext);
+
 int device_match_devt(struct device *dev, const void *pdevt)
 {
 	return dev->devt == *(dev_t *)pdevt;
diff --git a/include/linux/device/bus.h b/include/linux/device/bus.h
index 99c3c83ea520876ab3577ffa76f159f89f4f86c5..bb6ed08c39aee497feabdba82d2e8f89ca1c8b5f 100644
--- a/include/linux/device/bus.h
+++ b/include/linux/device/bus.h
@@ -137,6 +137,7 @@ int device_match_name(struct device *dev, const void *name);
 int device_match_type(struct device *dev, const void *type);
 int device_match_of_node(struct device *dev, const void *np);
 int device_match_fwnode(struct device *dev, const void *fwnode);
+int device_match_fwnode_ext(struct device *dev, const void *fwnode);
 int device_match_devt(struct device *dev, const void *pdevt);
 int device_match_acpi_dev(struct device *dev, const void *adev);
 int device_match_acpi_handle(struct device *dev, const void *handle);

-- 
2.47.3


