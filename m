Return-Path: <linux-gpio+bounces-32044-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCDiMWZ2nGmwHwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32044-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 16:46:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEAF178FEA
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 16:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 881F330B60AE
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 15:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCF22FF153;
	Mon, 23 Feb 2026 15:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e/cAMltJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NFE4gCV5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F8C2FD1B6
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 15:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771861286; cv=none; b=JDU1QFAal6zEdVbtcSeRqz+vKNQ20fv24Ze+cDLrMIzKZs3Menc3RU0EBADQJ5b7hOHDGOQdjY90ucbmS1FHwqVgxTlSh6ogUzd4dz6irHE5CfclZqeFCmE7kjCGNfTkXh2orCVnstHmkVz5L/l7D7iW6q6OKfTtYAESau0hlq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771861286; c=relaxed/simple;
	bh=BNNIjvS76V/Hdkeg6mk+QBQ5AT8jv6jaK5X2R0TgRPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tKUfgLefv9ZlM6RzfxX2AWHna3SJiItMOeNwa6Oa7nAxcDg4/39rBAcYtL0/J98nBN4knzKU1fCYUYe90KGve8t4mLj31Qq56c23xW2HK2FKrqFXJHXM9yzX30y4dmUE1jaoEdR7Sb/RJo0KshUQMeuCE3mO5PhLoIS4D3Lm+v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e/cAMltJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NFE4gCV5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NDsUjB185737
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 15:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZjEW/a3QR9rT3ZJb9meXpjWiYGeiMJNq2GHOjywEIkI=; b=e/cAMltJvYlAY5t3
	RzXeXW7YXpeLYFk7Z2h5TyBrxRfGfbSDnwl3xq50n87WPkP4GAgoQnHan8HOmpuq
	8FE/cvIxyHjLhWaTQ/zcHJkRL/2uKVyDu+i9C8Azr+1AK7szEe7Loe0tJEWDmfQf
	XzRh3yh+Z/sBlZkqwgfa9/ptJl+uazOoJFrL7kQ8RimnX2aSTCHjxeXW5sC9ywvw
	pjM0520XLXTcbl5OKvGWk8OUy58W2d8POFw5fK2umMgjwUoWoR85r16YcQEtwhXi
	TFIb8+LID3ThAA+sIyPksNVoRKdZlSnyJ3Zv9jG2KWF3P/8wAmiTa+cLks8fOQOa
	/l5STw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgr69gb54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 15:41:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb706313beso631928285a.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 07:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771861283; x=1772466083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZjEW/a3QR9rT3ZJb9meXpjWiYGeiMJNq2GHOjywEIkI=;
        b=NFE4gCV5tMVUHwlZ5r7BWfsM7fkJlEsPT0RjoMbx3BHOLTmHbyJ0Zz9NC19qkbYIa1
         +qtpU4gpfEuTBw0sydYfgsMfA0MXQaOpZTBpdg4XvcUWGkRrGTZfApWxf7kjoPxXZX0F
         hxLsUr8jTNRZxEpS+5YFdB9shW4lE3S+EBUyqa63JCi3c9KpBnIPshopiE13WAZzZc23
         Af39AFwhcqn0Xx9BjOmOxXBGhfQFIYFd0gvkZaIlGL7hsiBWmdM7HJerGl6xf+ffv/Gk
         IDiV1AaHJyVAA11q6rmBpUE0SEHVgLcRPmNtTmZ4shgTIieFU21N2fSo/bvkVyYKdyBZ
         GTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771861283; x=1772466083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZjEW/a3QR9rT3ZJb9meXpjWiYGeiMJNq2GHOjywEIkI=;
        b=iUrh28jneFLD1zmGHvNBm+DcRAEWrmLuAqOKxq/tKvEXMQIo/fi2+V+hBHF8utA89K
         +c51jDGllCXusxfPYPE5LeiEUaCkeC2UOVCFQah38rzkSi6s8t4q5zsbTejWYq8cQj/Q
         3Dvrz+qhfwtqzM8Wz5PLUq3sKMsd8oGvFDfu8HPpoN1wwxwnLEUkOFPnoauX3xH6oiF/
         pvvugMhlE5B8XqbiFS0BbW/oXZaVVi0UiznD31hz9l0JqGH8e8WsVG/dZh3rH0YbKsAW
         RnlBG1RrswcEY5zM5+HFzMhPotnsUfW4iMt9gpQg7OAni5JYUbdlkQTY1VThc3/iCkEM
         9HqA==
X-Forwarded-Encrypted: i=1; AJvYcCXxizQP8fKFYOTTi8ia7XE3QLBUprjhJyffrd2NoVZjbqAdcD/tzlh5KSfnL+Vv0Xj7E9EZ99ygrK1P@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4xnh5z48k5A1k9JzF7AmjSIof4e5qopBlXVD/CN5xq0MsuabD
	eag+rjj8yLCtI2aY3OrsllrUeRJMZuYEvUkOeEKmAYLfJdLvdVTSuxMEV4WwYlUAIv0RSuJeQFX
	ydcauw8WK8wqI+xdafLbf05vngY0S4SlVWz/8Mp3+3RJI5WzddVsBrzEXfEyHwKrA
X-Gm-Gg: AZuq6aKogjyGrkR0E71PgjqMIpo9uWdOTJRAaNYDQgz0fCkEUzIj3NM4hgicUP/cB09
	9bMyf0Zt7Pfoo/oWL+GxXz/4eM0MD1ANy0JZ99/XLxwqcG1rXtgRuxCwBoW3IBLdsesEmRTIos7
	YxYK+KqYp7tR170lg9WqqbczazHh3Rf1688Pe9KnwuFSQGgaoDMMny5dkdO9u/Qw0JSsPEZl7v/
	z6MYN3ANlKEM63Mk70wfYPALcUvk74uRS3ip2njVoZLdeKyv/Y9ICPHxwlznAcmJbeOE0iyb9fR
	W5tk4NBrDhYASWVjOmKPD9LPxRXqHsHbMQlQmgjUg8KE6oIii+mJYxFZrVvGIc/itjJ47nBoDZI
	ohyXyZ2dlmmHMfk/m9DENeCf5c/uOXy4vKi/XXxv8mFr17buMBMzK
X-Received: by 2002:a05:620a:4691:b0:8b1:1585:225d with SMTP id af79cd13be357-8cb8caa16femr980033485a.82.1771861283259;
        Mon, 23 Feb 2026 07:41:23 -0800 (PST)
X-Received: by 2002:a05:620a:4691:b0:8b1:1585:225d with SMTP id af79cd13be357-8cb8caa16femr980028085a.82.1771861282763;
        Mon, 23 Feb 2026 07:41:22 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3d88sm295266755e9.3.2026.02.23.07.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 07:41:22 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 16:40:53 +0100
Subject: [PATCH v2 2/2] gpiolib: match secondary fwnode too in
 gpio_device_find_by_fwnode()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-device-match-secondary-fwnode-v2-2-966c00c9eeeb@oss.qualcomm.com>
References: <20260223-device-match-secondary-fwnode-v2-0-966c00c9eeeb@oss.qualcomm.com>
In-Reply-To: <20260223-device-match-secondary-fwnode-v2-0-966c00c9eeeb@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Len Brown <lenb@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, brgl@kernel.org,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1416;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BNNIjvS76V/Hdkeg6mk+QBQ5AT8jv6jaK5X2R0TgRPI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnHUcXGUZFY2bJGG6ak3/hcC6aURUqtliv5WGm
 JaCvkmr3UuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZx1HAAKCRAFnS7L/zaE
 wx7iD/9Ox2KjiCRYRPB7DEiGMzPK7yYFaZJwMiRI3r2n1MY5PCTCkPqxCpTyZBUW/XsuZ4uTbom
 dlangVitHGjm3QhThgnK6uNDUiEdtyth9gm2ocqbQClRWeLxdzJnDZBpIgoujcI2otS2KbvkEJV
 C6XZRSKZVqDTZ4bY9XoB4bq9YTjcxe0AWPflUfh3fdgTq3I3HpNDoX3bZeOrWmVVzhmTiD/bbe3
 Qiq9ZmPU00EjzKWv/8upoOuOjr9Uv9P7Kfig9CC503P2ekwI36Bp2scgbdn/2ZKW6Bo7p0LWsUq
 cQc+POtJWewxGnjgGp3SWagAOecMdlP5RaiWRN+1nWxOK84Occ7JBOSpo9j1wzcoitQxyRakns9
 4fXj2P/eQZF7ssehnRGbCsuJd+lY1Ia4KUz6VYBAbG3VzimBbazJxUwI8D6493EgeRViKlK60m9
 7ri2wg5PVBd0RkOepLgh2MudpvSq5sYFV8pg3LogJmD/stJWcCVI0KjcAdCW1WQZJZXXOeGthel
 tUccrql7+xx4xP/EgGjc0CttNv8Afd0ti2Cpi2fsaO8iqbXV1okEGJKNleljY1aNnHIyvsNY3Zz
 GlfW2OhexWouW+TtWQB6zZ2ioq6EeY2YYEIGUGjcN5OSmgTKtMKGD5tzvKSwxAMz2X+dFsQGtfo
 QQs8Pj4fcG0WFpQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=O6A0fR9W c=1 sm=1 tr=0 ts=699c7524 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=h1C75ECfyOkdviiQQ0oA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: b-L5Bb1hvoPzHFNFIRT7vfuFrv-mPzzh
X-Proofpoint-GUID: b-L5Bb1hvoPzHFNFIRT7vfuFrv-mPzzh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEzNCBTYWx0ZWRfX1JqnSzpYfxZB
 RRtJbzh8XdhcVFMPUbH1KyiqdJXLr5yfWAwrOn9nafb/hijm+5BvFg+Wr9Z0bLkPEa7whApiurk
 V0InGFR6Drsjsc5DgyN13Q/ntCJezXdHep4ZDDGAZqgfMJgFpDf8NsDNGaKc4v7Bv9x9s7gdAz5
 vDCq6zeW5OipojnoLsI0t1RkJvkl7hDZwRrt6pBsX9ly6IQDKlVgkrBLJL/VawKvQKQy7HinWuA
 Jc31+2HYnKB6nJaLzwHNQ324ZcW7JgKmQoQudRLUrwwsL8uUvGyif9PQyAAZv/zs73/iZ3sI42f
 y5/JdIe/Ade9pIhbC+EFxISA9TLpzFxuup3JN8bfM+LiT1WYMFGkj2kTQHCY/w8kTMuA/5IXJ3w
 As33zy599IQZa8k44eeovabrf34436hq1IjyXRBikJMFW2peZxOIWhy4xWUZeX0DiA9OrzYwi5g
 RkKR4QJWbt+l+Ob9lfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230134
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32044-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3CEAF178FEA
X-Rspamd-Action: no action

In GPIOLIB, during fwnode lookup, after having resolved the consumer's
reference to a specific fwnode, we only match it against the primary
node of the controllers. Let's extend that to also the secondary node by
reworking gpio_chip_match_by_fwnode()

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c52200eaaaff82b12f22dd1ee8459bdd8ec10d81..7fe1d9ab1281d6c5022b9bdd8909fef2cb74122e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -11,6 +11,7 @@
 #include <linux/errno.h>
 #include <linux/file.h>
 #include <linux/fs.h>
+#include <linux/fwnode.h>
 #include <linux/idr.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -1395,7 +1396,16 @@ EXPORT_SYMBOL_GPL(gpio_device_find_by_label);
 
 static int gpio_chip_match_by_fwnode(struct gpio_chip *gc, const void *fwnode)
 {
-	return device_match_fwnode(&gc->gpiodev->dev, fwnode);
+	struct device *dev = &gc->gpiodev->dev;
+	struct fwnode_handle *node = dev_fwnode(dev);
+
+	if (IS_ERR(fwnode))
+		return 0;
+
+	if (device_match_fwnode(dev, fwnode))
+		return 1;
+
+	return fwnode_is_primary(node) && node->secondary == fwnode;
 }
 
 /**

-- 
2.47.3


