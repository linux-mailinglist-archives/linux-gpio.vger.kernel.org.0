Return-Path: <linux-gpio+bounces-34628-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFC4BNuDz2mwwwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34628-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 11:09:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9A83929CE
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 11:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FE4D309698D
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 09:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCF638657D;
	Fri,  3 Apr 2026 09:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4D1Hi7S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ohr8nwmG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEB33890FE
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 09:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775207030; cv=none; b=j3zSImVw30taqZQbCKO8D+ze/AmRuurh8p7TlGF8H2JJqDDQ0ZDBSmjhn+gR8Q3rdLEhf0ZnTjIGowrJHOc/WyRJVJ4n6wTmba7QidjCDq49uanbo79hQBKXwgRlSG7mDxFYaP5C1DhiDvBsqw/jaYEh9+F/VA0lOfsvpVS17ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775207030; c=relaxed/simple;
	bh=OQ5bfwpNtqKoORzjqOgKNt+gU4CVOnEO9xS4ZGiG5dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kTHeeJ/qUgdACaCc+7zF6hOGuODfGuyvNJ/R71DBEhIKeHti2vvh6X7coONVl5/zLP8YkopF7LVYe0LFPufeT37ksmC5KMSvIU0a5i7wcDLsfxpcynj0+HIBmOVg31x9D3oDPhuimbNPAKMY7X9k9Aj0zPr04rloejwBW9/qsKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4D1Hi7S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ohr8nwmG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6337dajj2706999
	for <linux-gpio@vger.kernel.org>; Fri, 3 Apr 2026 09:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A512362zZQbuhvzw7LFit+apZtaCdvogNoibBWCfe+M=; b=R4D1Hi7SIJODx/P4
	JgxrBUZLfnJulQb77W8eDWqj8cyuaKkI2BzhtKoY58I9oEVJOtEXqkR/T5CBoPCv
	06L4q2FZBHcG4d7e+VFwitSBu7Qfc4ib1E42cgZ69z2fB/HJY7lcHpehU3d8fEN7
	wQWPTwjKb7Oku5nUjO0oOYCw1+eXt+VUsXOOEpDR3PtSIOIlUSf/2HWmtulRHLfj
	MqeR6gsEhhyEFZIvENqwS+yuQCKTLQf0SfLGOnun8xprvY4axqfWlS0+zvgAAcD1
	4yf3+zijJhP3TBC7C9APioDAI6Zlku/M4zIO7WFwsr4WjbyQQV+s7gBnxPmMVdbR
	yA4ELA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9yfjhuws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 09:03:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091327215dso79585571cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 02:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775207026; x=1775811826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A512362zZQbuhvzw7LFit+apZtaCdvogNoibBWCfe+M=;
        b=Ohr8nwmG7jyrgqRvRJ/DMEioZtJYrXB6j8PUvoEjczuJbETVyA6joCjlNfplfvDCQ8
         xQDW3tIZ8CBL0N5h6uO5eP0hKnbrUNEOle1KDULUqGT9VTCtALgrkwVBI9JjopqtiQ1I
         S8QZDJWNducSwmgfSvLBF2YR3sHq7opwGYVF/gws7n4NsXXuEEIHxWZ10P20l5IY9S/M
         YKqnGoLsFzFPODalb5BeJbnmQ+6tjlmaoJp6y6eM1l1TOL3t+5IOSbWfXZSL6zS+tAOY
         xGdhanFZI9k9+eS1UZQqhVLL6sA/i0TjhQ+kpIVfRTwAgODvCb+XF+kdFU0gUkLc1FV5
         Avyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775207026; x=1775811826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A512362zZQbuhvzw7LFit+apZtaCdvogNoibBWCfe+M=;
        b=K+G6Np2ZCG6zCbvehThhAVqWJj6XzmuLjZqiqgeij1u68Jp7nQ1ipAQ7v2e+56iNZm
         r+LV9sXCJxkd9JkoCUFQW2CIKOWfyfPrFknLmvkdIVy4i8x/OUC2ue+rL5WlTaX9i1AX
         +JABg8hYIlPVs1x+aiRJIET089qG0MQyitX51x2Z7PNLDnBu8il3SA5iPBRGQMdgdiSY
         6N6YcytvcXfqweULPW57ywtbVKZ1iqaRO/7dLh+V9BbbRazus6kxWBCQ+u87AzE3Ikb1
         eIUpTx87v+8sNy/hcArUFPuduZG4suJ/P+CgcHFMFruq+iFumhx8429feYpXEUAj0Fgo
         I+OQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoShSQEmdAyl+Pgxwpnb308ghVmYl9FAreD24OrKgHKTwQY0x+APWtEhkowH3RotPzMQAtcPh2RHWH@vger.kernel.org
X-Gm-Message-State: AOJu0YzwiwuNRKCkov+BJAp0XOkUkdaZMwY92q81hG0JBtQH+9tjsa5E
	HwN8o4X7EmXj6ZUG1bBRUoc5ihuNchrQRhQAtouXQxd/W+SKOUt3S4d1KTPoLTEaWqE5+YS7ulC
	OkxVfy7xgLma//ao2Zykp3ZPm4fU8sAa0BtOeT79n/kr2iYorrKWtBV6O+E3nlkf4
X-Gm-Gg: ATEYQzwN6A1s7y9Vd6+MEQ9iLvfw33fyOnL/dPt+2Tqno+3UYzB/D9uPjxxhNo21pn2
	B9X0v/fVMJTclNYPSXDKBUJ8WD13NGwxXTDEnqpf7Hw9qsfEHXj1tN4KuEgaKAu9OcPGEVlZ/BF
	7W8IEUev97OTNHv+YFQM9I3jRAxlgZjeX0rAuhXD/aSOoQHm8UA1kdHJWubtLt4RA9fyHdslrxA
	iAZRiMg2e1X9/BUzMC3vYj4YpfutsPzw3e0VBxeJa0z3qYvT4Ntg3uSfTpmIAR+ZsG+nm5fnXXx
	ZB5K57PZTieyZ1XCGhjRmkCJlu7Sznykv6E6RWBAkb9zg8woQahc6hdFM+q/ySG3fojCrCMnMHK
	Bt2XuHUZdw0EGxGEsszJFJ5FOJhf+Je61kJ0lHr++t9Q8OL2S6nA=
X-Received: by 2002:a05:622a:346:b0:50b:4bb6:d9b7 with SMTP id d75a77b69052e-50d62b58b81mr30891011cf.63.1775207026454;
        Fri, 03 Apr 2026 02:03:46 -0700 (PDT)
X-Received: by 2002:a05:622a:346:b0:50b:4bb6:d9b7 with SMTP id d75a77b69052e-50d62b58b81mr30890681cf.63.1775207025991;
        Fri, 03 Apr 2026 02:03:45 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b982:38c7:df87:b18f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488980df5afsm18723805e9.6.2026.04.03.02.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 02:03:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] gpiolib: Make deferral warnings debug messages
Date: Fri,  3 Apr 2026 11:03:42 +0200
Message-ID: <177520702059.10090.7671588942831580065.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401133441.47641-1-jonathanh@nvidia.com>
References: <20260401133441.47641-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KDL4HFhAIKQ8TGYilQJ2QMrTGBMcVwRb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA3OCBTYWx0ZWRfX8r1dq1CyoyU5
 krEQKgVBL7YdfX+ruEkQxM8RNVCzYCjAlDfQQj6nnBXYisa5gNciJwf2ORG8E4IpAZ1Hf/vmGs9
 Eay9G5CkcrdowBhiqOr2gXxtrIUn6skOWVEmWakRIMqsx0SyfKgSgRs7KtkBoUzUFXpt5vFfunm
 zCBQ30GzBXHEgWEL30CwZWdhgHHeOLpb2bWsUFpgI96YaObFFoot8W2AfGvysCpXnC414V5gYSM
 yEr0cPQpB8xbHh0EWIBpDnjiSOj4UQ8V2uVvfx42z5iiIA6U5c5jYIGJkY9xpFUMeP36RHYN6Qn
 czK6gu2E9XnvzpnOe1RURfyUILIyX95mgSoom/+7qOpJzKzCMfAfYdctgkJ09DmgdtHKpGE+aMz
 zdIAeI3e38LMDXrVZfMHv3yJmg8fjPGQ5QG0CfPyF6vZMs8NR6E4LIqWvkWUFXnEk4gor95ME7X
 g0nDMMucmuMtpH7jFBg==
X-Authority-Analysis: v=2.4 cv=OrpCCi/t c=1 sm=1 tr=0 ts=69cf8273 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-YVWButmvYyXKJA-fhUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: KDL4HFhAIKQ8TGYilQJ2QMrTGBMcVwRb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030078
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34628-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5F9A83929CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 01 Apr 2026 14:34:41 +0100, Jon Hunter wrote:
> With the recent addition of the shared GPIO support, warning messages
> such as the following are being observed ...
> 
>  reg-fixed-voltage regulator-vdd-3v3-pcie: cannot find GPIO chip
>   gpiolib_shared.proxy.6, deferring
> 
> These are seen even with GPIO_SHARED_PROXY=y.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: Make deferral warnings debug messages
      https://git.kernel.org/brgl/c/c0cd31bc3a92ac04147660a3821780f57b76bf1f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

