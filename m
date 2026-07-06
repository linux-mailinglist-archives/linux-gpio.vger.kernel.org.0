Return-Path: <linux-gpio+bounces-39519-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TBslHRioS2otYAEAu9opvQ
	(envelope-from <linux-gpio+bounces-39519-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 15:05:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A301B71101C
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 15:05:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VbXN+urT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BsIZKCnb;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39519-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39519-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CE023037BEE
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 12:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8DDD42F710;
	Mon,  6 Jul 2026 12:54:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C11416121
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 12:54:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342477; cv=none; b=WzzRSELtFINo7oUV+M2RgWGytqqahnzeMNS+lICP61aiNfHzIBN2IWDggKWZEfUil1+UWuBqEjTPLAiP3INsEel6uIqHxKIa+F6cz+ij5t6m/WUm5DdD6CWLa2oKpObmKJ2jBYvW4JbAHmIkqnOhgZ4oaViB7T7uLzuYDDQp6Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342477; c=relaxed/simple;
	bh=j/ZK6ExUuxxG1XJGSDlCW2aa45sq27hCD52obe1DfHU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U0HbchoOXmtHvUyW0ozmk/7ger10BC9GIGhM+YxTr58qjJj36Qv0ajfhjjDQfLZ/6qhvWi57busdZy+N2zN7uPXAhC8Zhm1xG6EWCneH+TmYwb23yRM/qkSuyDqI6JWb3nyyfi3MvDITGHFGfZgKfnJAUqDbX5CZxoXnACLe+sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VbXN+urT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BsIZKCnb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666Ax6SF391042
	for <linux-gpio@vger.kernel.org>; Mon, 6 Jul 2026 12:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=b0uvwgvESdJ1e3fK+qKM0F
	pZYStYyRNLeA0rpRF18uo=; b=VbXN+urTyJRLx2ACHDzsNAPpAALgCUrBh08uoK
	AhsVuC7SZJGRxAh+OsD42P1cqbjkoFmh11UjftxCggIFs26Dfzg1nX0dch50k4dG
	kgKunl5PmS78G6q+LaSzs0rMbTsCu39iWGl5649zEE+OBI/uthngD7XYTG4tE4E6
	RcsxH069m6JZl/5N95KS94r5bcm6Ce2FQM0xDJIm4dO9oM0seQ13CyT7Onh1AmPV
	Gg0ZJCfETuwtp6FPLfYgups6+8MqCmRa9ezOWh0Nii4H859vOdYP4XbXV+9by2Mr
	uooPM2IfBdMgL7SnK1M6sfG8jj79ms6yiDeGrjK8rdocJByA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgrsrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 12:54:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915f6ff639aso545550485a.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 05:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342475; x=1783947275; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b0uvwgvESdJ1e3fK+qKM0FpZYStYyRNLeA0rpRF18uo=;
        b=BsIZKCnbJQ0gFg9x1hU99nTiWdlkRgCanyiRs71bbCLvbbWQYk3fJSDy3lMFe97VJK
         qvFVm9POpbLPEWdD2Suaqio2QB5aysHvp10rKzoyhRxUf1rv8OX0wbmij+Y28oiAUaE4
         bB0d3gwpmENuyzXL8CY5Yz23HylbzZkCyPEKwSdbmSLQeTKMrQttL96byCH2Bpvfqw/0
         j9tqhzNp7utAIB3cateXnYLAdvhcGINUkciLjDk9cH1lz08d9cPYUIdswGNmjVSj4HsD
         OxAnCkn7azrkmMLIhfglq981b3YjG+2HQy63X5DRJTDTHnBHoSIGWUvwUIkARZ+7nvMS
         qjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342475; x=1783947275;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b0uvwgvESdJ1e3fK+qKM0FpZYStYyRNLeA0rpRF18uo=;
        b=Pi0qjl/izpY3j5o/G7+oLCfPLU7v0sG0/YNyOWg0jklvTuQ95emaktQOwzFEuZ5RRK
         ZWe14/6Ja5IK0loSnQsS5Zv+Wxc71/q2bVGtwK2/9W264IVBKpZJZRH+LqjYsgRX/7mW
         36ooxQvNGbRzDufT4jTgmAgTIUjj8hp7CmhfuddhZLrBYde/BmxNphVt+xfppf9kFPVS
         3TgQoEAxuiCTY4a8vGwZW3K9B/TMCrqfxPJyBpyaU0BHWye8qTSBRwkcOE9sna3X7UvE
         0ifvpKVENShy5sbW84iMZHBAiS7hsGYLKL195FsYuzyssLAnBHUSYC7Sqny0FY5SeOB7
         lCXA==
X-Forwarded-Encrypted: i=1; AHgh+RpyeQCl8DfO/StsWJDNgxi/KdVOd4Nby5EI40FjYZdDBORRGBfIYg18J/c88KYdGmjYub0haAcgi2UP@vger.kernel.org
X-Gm-Message-State: AOJu0YzKEvNk6fHdhlMWOHu3hLU5MnqfCpGQvxFKq7RxF8aHCbFYdWKR
	LIlXD+78U2kJtur4JblQZLp9H4xgQOfCTqc4LetuOnCn5GkQZ67zE/8lSZFsbeYYowKlFvvfO47
	CLTAxsbxWJor/fKeuDbOgKDTiq8aO6WyX4Ld12mhG955TLb8pzPciBihnvsKXjbul
X-Gm-Gg: AfdE7cmgxKaULbMiwE4mp4xutT5Vv1AOSqE3xVFxm7w3sfTSwXsk9SVV8+7Wy9a173U
	bRL6onC1Ee3A/WTS/LC+Egz9NIu/dppapoDgPsUOtMzhe2CVfjx86qY929RoBSKeTpI633tFIOC
	fJZIxD2X0m9jEX8LcEZTPDFsKIYOl9a6CG2XmfkbWgQurNB8gCakUObyvWCcmOvIs3kRoi4P+jr
	6uUU36tAuWy6eznOzrJLBWZP7wXUNTrBJScHgsGRIqJeXYem70c3bzqBYPEeDZ9se0MthIBGWEt
	UtNEji1Tbg2vTPgljp304rH+RPVcp/HYEMzSwwxsowG410F3baYuhLCmuCFdm5/3tydunEr4YxG
	endKRXk5b+ji2xAiBq8vTIOmP80/HGJ/B6oGmgAsB
X-Received: by 2002:a05:620a:6f06:b0:92e:6a0e:a192 with SMTP id af79cd13be357-92ebb57e75emr57465685a.49.1783342474536;
        Mon, 06 Jul 2026 05:54:34 -0700 (PDT)
X-Received: by 2002:a05:620a:6f06:b0:92e:6a0e:a192 with SMTP id af79cd13be357-92ebb57e75emr57460985a.49.1783342474072;
        Mon, 06 Jul 2026 05:54:34 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e736sm26856931f8f.7.2026.07.06.05.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:54:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/5] software node: provide support for fw_devlink
Date: Mon, 06 Jul 2026 14:54:07 +0200
Message-Id: <20260706-swnode-fw-devlink-v2-0-f39b09d50112@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG+lS2oC/22NwQ6CMBBEf4Xs2ZJSgYAn/8NwgHaRjdBiV4uG8
 O9W4tHLJG+SebMCoydkOCUreAzE5GwEdUhAD629oiATGZRUpSxlLXixzqDoF2EwjGRvQhtdGZ1
 jobsc4m722NNrd16ayAPxw/n3fhGyb/uzqX+2kAkpulrKouryrDrWZ8ec3p/tqN00pTGg2bbtA
 1QvECW5AAAA
X-Change-ID: 20260609-swnode-fw-devlink-cdc8dc4e5cb4
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
        driver-core@lists.linux.dev, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3679;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=j/ZK6ExUuxxG1XJGSDlCW2aa45sq27hCD52obe1DfHU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6WBYQrpy0ZHmwjOS33DDQLwb1xXf5+gQKAD5
 zCVZbGJBKqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakulgQAKCRAFnS7L/zaE
 w9NPD/wO9u4RjtzAd/KO/SZCDbQHuPhkalkh8Xr7gIsSTHw+oKCxzvf2wSR+DSmlELrGqjd9pUh
 C/Ksq86FuPN+JnaaRt3dGErLGTuTq3zALu6KNWPd4/ekUzK682W9ps6Fv81MueyNh9dclA0eSJ2
 GdlREszlGGdXPA1PMjpHUNks40RsfXqXonSsbBgbTPvDzB0XUEz7K+vWSSYSA15xxvS4GHgk0n/
 PNHHyAVUj+O+ToUIE1zDc0HeTspMLxvdPbmlundeNg4RWkgmzLYyMboeCZzXv3j2vCvxc/Q5RG3
 SBxWLwxfgMCe817xmi6Mp6Us2UaZ/JxmuRWHBvqZ8HH1o/Q08WTtjtSI+CrOmoQt0uKlyJR13I5
 rpj7UOT6+Hk66adqfRZ019jyRBLKpT185TQXlK97lY8+jsg7CObtv9/nS7o1bfgrPywmuozt/oz
 cqOBcdfNbCfUKKrj9XQyS0g5sRPv556ykS/ZID1Kmfb0y7cs9oyaplRUCMKrxNK96lF+9+Sl7+M
 6SI3YFpH2bwlozCSzRsqnwo7Cm+2bdfMmCzbv86UmKJ3YTmXPgArKOKb0kV0g3/ur6VWLyACMyp
 DtPd0VbFrhoFKuVqoMW2bDnwoi+bgkwNO8OJlEXo7VrEHge+6dMQgFa3UMPhXNJfKKmxAPi77rk
 Gc5jOBH507DyGYQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 4p8t_h6CBQ0NPKZN3ElXx15YaBizPbu6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfX9bKx65g9ca7Y
 n0PAhGL3I9sbDU+q1p6w6jfnVc/NHv41N6vum+bUqtKVF+3gkJlhKh/EYlEnWtX0QkfFcmJpGB3
 xBbWRG/7uESzGihC0+MEpJ8FlvMqUolrnuF7jXWnCfbYSeAfyfnpTG19L13z1PmOOu2cE6CqEWJ
 5rge/Isnn0ZErAa4iWqQ9m7CQBFDv43x1V6naXlRWtAgjq4erXtHMgGDU+LxxyRiItAG25cUqSj
 +kQ3MQFsEEn0l1TtFEVJnqcoB3GJQsXBtk4orHELQ1aGCOjFLRXF5v+A+RRIAbaeh94tpDTwepi
 cFXe3Vsf1hXnyZHe1c7ykdOItGSIkC9CVLIb27JEGdKL+NuZ7ay2TrUXfhz7Z+FcMec5FOsJnqu
 QqRZofbKwXUIE4Tl+bNnw5SZfATw14vMO9UjXLqE2DEZlpucDOcxNzGTKp+su5l0xn9MjEcbkVa
 k7zULCAawceTrMiumfw==
X-Proofpoint-ORIG-GUID: 4p8t_h6CBQ0NPKZN3ElXx15YaBizPbu6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfX4J8RTIo/97/I
 G3Dvia7oMcM+HTsmRWLhyuJiotm1tHdBFA4DzivFIVg1CoYfI44Zc7/5Qh/lqlCkxUR7f1+ey7g
 0RSEVNvmrnV3rIKu4Q7cVmocsew/lC0=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4ba58b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=Je3Peepqufej3slHyXgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39519-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS(0.00)[m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,msgid.link:url,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A301B71101C

Currently only devicetree systems have their devices' probe ordered
against their suppliers automatically by fw_devlink. Software nodes have
lately been used extensively treewide to describe references to resource
suppliers: most notably, the GPIO subsystem uses it in many places. Now
that the conversion of "dangling" GPIO chip software nodes to using real
links is almost done, it makes sense to ensure no needless probe
deferrals by implementing the add_links() callback from the fwnode
interface.

This series extends software node support to use fw_devlink and adds test
coverage for the new behaviour.

Patch 1 adds new kunit helpers that will be used later on for test
cases.

Patch 2 implements software_node_add_links() modelled on
of_fwnode_add_links(): for every reference property it resolves the
supplier and links to it. There's no allowlist like in DT - a software
node only carries a reference when its author explicitly wants one, so
every reference is an intentional supplier dependency. Graph
"remote-endpoint" references, unregistered supplier software nodes and
self-references are skipped. It also mirrors the device pointer onto a
secondary software node so fw_devlink can find the supplier device, and
purges the fwnode links on release.

Patches 3 and 5 add the tests: a kunit suite for the add_links() op
itself and GPIO tests for a real-life use-case: a GPIO consumer
referencing its provider via a software node.

Patch 4 proposes to add myself as a reviewer of software nodes.

Caveats: a supplier software node must be registered before the consumer
device is added, If the swnode is registered after the consumer was added,
add_links() has already run and set FWNODE_FLAG_LINKS_ADDED, so the late
supplier is missed. Graph/remote- endpoint ordering is left out for now as
well as there are no known users.

Merging strategy: with an Ack from Kunit maintainers, the entire series
can go through the driver core tree.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Use loop-local variables where applicable
- Reformat a long comment
- Keep trailing commas on array initializations which may potentially be
  extended in the future
- Add missing headers
- Update MAINTAINERS in commit adding a new file
- Initialize arrays at declaration
- Fix signedness of ints where needed
- Remove unneeded DISABLE_STRUCTLEAK_PLUGIN switch for swnode tests
- Link to v1: https://patch.msgid.link/20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com

---
Bartosz Golaszewski (5):
      kunit: provide a set of fwnode-oriented helpers
      software node: add fw_devlink support
      software node: add kunit tests for fw_devlink support
      MAINTAINERS: add myself as reviewer of software node support
      gpio: kunit: add test cases verifying swnode devlink support

 MAINTAINERS                             |   2 +
 drivers/base/swnode.c                   |  79 ++++++++
 drivers/base/test/Kconfig               |   5 +
 drivers/base/test/Makefile              |   2 +
 drivers/base/test/swnode-devlink-test.c | 339 ++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-kunit.c            | 273 ++++++++++++++++++++++++-
 include/kunit/fwnode.h                  |  26 +++
 lib/kunit/Makefile                      |   1 +
 lib/kunit/fwnode.c                      | 116 +++++++++++
 9 files changed, 836 insertions(+), 7 deletions(-)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260609-swnode-fw-devlink-cdc8dc4e5cb4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


