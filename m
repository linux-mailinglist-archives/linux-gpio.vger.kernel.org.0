Return-Path: <linux-gpio+bounces-39729-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p3d7JRJlT2qXfwIAu9opvQ
	(envelope-from <linux-gpio+bounces-39729-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 11:08:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EB172EB3B
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 11:08:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b=VC47+a0X;
	dmarc=pass (policy=quarantine) header.from=analog.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39729-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39729-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A39D2311E299
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 08:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B70402448;
	Thu,  9 Jul 2026 08:51:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF92401A25;
	Thu,  9 Jul 2026 08:51:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587072; cv=none; b=Jbd6hvOd66m0g3HAmpwZ/LT2OuH8iVCdwEqxJBbk+Eml6KOAYHI0h5kweIm3b5QcksTflWTxNGUzz7DmH1RCHqzul0mOGC9iDHAE4PlejWlb2CJSc9HrfO2kADhh3YWOo6iAw2/suiaZ1lAbcpbXIrQkeDcXXT+T00jxVCNP73c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587072; c=relaxed/simple;
	bh=Gzue0wXD7dOgBiIiLp1g8F0rX9C137u75V+oh7Yxv1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cQ0S+lir4+P7cHdWnk1nX3weLUPz63MyZc0/QftgZXPmA3LfefbYmPFtcqK6TVSC0/OUgHoOITLkGHTnvgDZyf3rJWEULIqtTChO54XKCPuYuW5iFvpwR+xhduQQzZf8oOt6Hzwl893PvTI+yg/FS4lc6hRtvyBrp6Hk7N5Hcx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=VC47+a0X; arc=none smtp.client-ip=148.163.135.77
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6697aLtq267962;
	Thu, 9 Jul 2026 04:50:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=lHdOD
	KHongYEY/mkHZFd+aKhUu6QqlZLnHMVB+W9gI8=; b=VC47+a0X6zj/hWl8kNA1G
	ytuEKTUfpfAgyBmy0ZMk4uRSWo+6bXn2oGJq9+q9MfXm2WVnioF0nbcg9cRDN8pu
	6G0JN9WtURyHT/IXB5pItZJZXqGm73EmedBRczHU47v+Zz4sh17FmdIVRXIvNtvd
	4L0JUrcTdb+3BN/o/zjiwlRY/CXY/zGVkQe1KB8QJAgfseiNJ14QntDZ6D66rOFw
	cE7gPvplk8hIg6mrPEzGITpy8Y6sJ9WBqJbtRcY+c6vk0Qg4gQBJtlEF0L8CT9/E
	UbejqmHItNMUeLNssNmXk9otrJeAfs/7D61DyNf7KUZow1bF2CfDu+Yys2e2Gnu3
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4fa2jghraf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 04:50:55 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6698osSa003610
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jul 2026 04:50:54 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Thu, 9 Jul
 2026 04:50:54 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 9 Jul 2026 04:50:54 -0400
Received: from HYB-e1y2fvUQ3cx.ad.analog.com (HYB-e1y2fvUQ3cx.ad.analog.com [10.44.3.70])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6698oLR2015849;
	Thu, 9 Jul 2026 04:50:47 -0400
From: Janani Sunil <janani.sunil@analog.com>
Date: Thu, 9 Jul 2026 10:50:17 +0200
Subject: [PATCH 6/6] Documentation: iio: Add AD7768 Documentation
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260709-ad7768-driver-v1-6-44e1194fd96a@analog.com>
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
In-Reply-To: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Michael Hennerich
	<Michael.Hennerich@analog.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David
 Lechner <dlechner@baylibre.com>,
        Andy Shevchenko <andy@kernel.org>, Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux@analog.com>, <linux-iio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <jananisunil.dev@gmail.com>, Janani Sunil <janani.sunil@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783587021; l=9441;
 i=janani.sunil@analog.com; s=20260507; h=from:subject:message-id;
 bh=Gzue0wXD7dOgBiIiLp1g8F0rX9C137u75V+oh7Yxv1w=;
 b=go9SaAst0su+CEu08GXXG4+pn0Pwhnj7LQaX1urggcSmBGjMugPcjEIMSe6idmxsGHXAV/NGJ
 /3Usa1IYcSIAhnTI3OiHT4eO6VJOgsbu4b730Yb7GC01TQYEOZ4QJwU
X-Developer-Key: i=janani.sunil@analog.com; a=ed25519;
 pk=e25MyjRLPY3RWrYm/LrJ+/+t1MZJUbkgIW5CZg+g+hA=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfXwZic2XDUvkKB
 EkeV5LgxVnVCieUQeXoCcgtwqXffiUSiDszkY0svnKKb5Ri9fpKA5Z5WZp++CWGoj1jjrt88Tna
 Xv+R2SqlkzyZ9HlOLLtUjyMIQYNi7TiEUITiZAcbldqAs5mtebx0
X-Authority-Analysis: v=2.4 cv=bPcm5v+Z c=1 sm=1 tr=0 ts=6a4f60ef cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8
 a=VwQbUJbxAAAA:8 a=GV2GhdOKgmG-7AKwTDsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: jQkRfAWnSYx8XI0sZvIO71I1U0m4BF7L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX9k+7xwwST4je
 mbjxw/FpIPVkUaY+qJ36tOXQfqyIeUPtrk+3eJm+eSDF0EKWWZ1lDzH+LGx56J5JyvQU4zIF7pM
 HAsQi1RUt9A+V2+swEB5jKR7B8fOJm/wf2Xzhlr2jNcHXNUSZMa6s2FGyVb0ONx1X2TurQ5dVmc
 hpbtdy89WwjWCrLmnvGnyWaEq+Zm9Dm3ofy5vSpM+ie3WeKhuKGKziwSJGTrWbwuENoh4p/0mYp
 18AyO0Qpd5uR7AeqIQSu1vw2RzrEMl+iXhrEu5JWOCUWpindaIivV5vmbmM8ZQZTHdML4BfUGcc
 sQIGyMxpAk96vJPbbhW5ZLN8GAPH+V/97dQJBoNo7ou55GARP4bcTzrszJJQyQxyxgbh3TUBqUN
 koVSGfuTu7XgeBkmwBNqhNMBmlKATJLX1M+4kxMcF2DkBUGPoFXFC4gXCEx6DxCCotDEQRH2HnW
 B9cBY5aqHkgWi8JXztg==
X-Proofpoint-ORIG-GUID: jQkRfAWnSYx8XI0sZvIO71I1U0m4BF7L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39729-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nuno.sa@analog.com,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:olivier.moysan@foss.st.com,m:p.zabel@pengutronix.de,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jananisunil.dev@gmail.com,m:janani.sunil@analog.com,m:krzk@kernel.org,m:conor@kernel.org,m:jananisunildev@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[janani.sunil@analog.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[analog.com,vger.kernel.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:dkim,analog.com:mid,analog.com:from_mime,analog.com:url,analog.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[janani.sunil@analog.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08EB172EB3B

Add driver documentation for AD7768

Signed-off-by: Janani Sunil <janani.sunil@analog.com>
---
 Documentation/iio/ad7768.rst | 207 +++++++++++++++++++++++++++++++++++++++++++
 Documentation/iio/index.rst  |   1 +
 MAINTAINERS                  |   1 +
 3 files changed, 209 insertions(+)

diff --git a/Documentation/iio/ad7768.rst b/Documentation/iio/ad7768.rst
new file mode 100644
index 000000000000..438e33d4f375
--- /dev/null
+++ b/Documentation/iio/ad7768.rst
@@ -0,0 +1,207 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+=============
+AD7768 driver
+=============
+
+ADC driver for Analog Devices Inc. AD7768 and AD7768-4 devices. The module name
+is ``ad7768``.
+
+Supported devices
+=================
+
+The following chips are supported by this driver:
+
+* `AD7768 <https://www.analog.com/en/products/ad7768.html>`_ - 8-channel, 24-bit simultaneous sampling ADC
+* `AD7768-4 <https://www.analog.com/en/products/ad7768-4.html>`_ - 4-channel, 24-bit simultaneous sampling ADC
+
+Supported features
+==================
+
+Power modes
+-----------
+
+The AD7768 family supports three configurable power and performance modes:
+
+* **Low power mode** - Optimized for lowest power consumption
+* **Median mode** - Balanced power and performance
+* **Fast mode** - Highest performance with maximum sampling rates
+
+The power mode affects the available sampling frequencies and power consumption.
+Set via the ``adi,power-mode`` device tree property.
+
+Data output configuration
+-------------------------
+
+The devices support flexible serial data output configurations:
+
+AD7768 data lines
+^^^^^^^^^^^^^^^^^
+
+* 1 data line (DOUT0) - Standard single-lane output
+* 2 data lines (DOUT0, DOUT1) - Dual-lane output for higher throughput
+* 8 data lines (DOUT0-DOUT7) - Maximum throughput, one line per channel
+
+AD7768-4 data lines
+^^^^^^^^^^^^^^^^^^^
+
+* 1 data line (DOUT0) - Standard single-lane output
+* 4 data lines (DOUT0-DOUT3) - Maximum throughput, one line per channel
+
+The number of data lines is configured via the ``adi,data-lines-number``
+device tree property.
+
+Channel configuration
+---------------------
+
+Each channel can be individually configured with:
+
+Channel modes
+^^^^^^^^^^^^^
+
+* **Mode A** - First set of filter and decimation settings
+* **Mode B** - Second set of filter and decimation settings
+
+Each channel can be assigned to either Mode A or Mode B via the
+``adi,ch-mode`` device tree property.
+
+Channels assigned to the same mode share the same runtime filter and
+decimation configuration. The per-channel IIO attributes for sampling
+frequency and filter type are aliases to the channel's assigned mode
+profile rather than independent per-channel settings.
+
+Precharge and reference buffers
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Per-channel buffer control for optimal signal integrity:
+
+* Positive input precharge buffer (``adi,prebuf-pos-en``)
+* Negative input precharge buffer (``adi,prebuf-neg-en``)
+* Positive reference buffer (``adi,refbuf-pos-en``)
+* Negative reference buffer (``adi,refbuf-neg-en``)
+
+Common mode voltage
+-------------------
+
+Configurable common mode output voltage levels:
+
+* (AVDD - AVSS) / 2V
+* 1.65V
+* 2.5V
+* 2.14V
+
+Set via the ``adi,common-mode-output`` device tree property.
+The common mode buffer can be powered down using ``adi,vcm-power-down``.
+
+Filter types
+------------
+
+Two digital filter types are available:
+
+* **Wideband** - Optimized for wide bandwidth applications
+* **Sinc5** - Fifth-order sinc filter for high rejection of out-of-band noise
+
+IIO backend support
+-------------------
+
+The driver integrates with IIO backends (e.g., AXI ADC) for high-speed data
+capture and DMA operations. Features include:
+
+* Automatic channel enable/disable based on scan mask
+* CRC on data interface. CRC replaces the header every 4th output sample.
+* High-throughput buffered data acquisition
+
+GPIO controller
+---------------
+
+The AD7768 includes a 5-pin GPIO controller for auxiliary digital I/O
+operations. The GPIO pins can be configured as inputs or outputs.
+
+Device attributes
+=================
+
+The following IIO attributes are available for each enabled channel:
+
+Sampling frequency
+------------------
+
++---------------------------------------+--------------------------------------------------------------+
+| Attribute                             | Description                                                  |
++=======================================+==============================================================+
+| ``in_voltage<N>_sampling_frequency``  | Current sampling frequency in Hz for channel N. Channels     |
+|                                       | assigned to the same mode profile read back the same value.  |
++---------------------------------------+--------------------------------------------------------------+
+
+Filter configuration
+---------------------
+
++---------------------------------------+--------------------------------------------------------------+
+| Attribute                             | Description                                                  |
++=======================================+==============================================================+
+| ``in_voltage<N>_filter_type``         | Current filter type for channel N: "wideband" or "sinc5".    |
+|                                       | Channels assigned to the same mode profile share this value. |
++---------------------------------------+--------------------------------------------------------------+
+| ``in_voltage<N>_filter_type_          | Available filter types for channel N: "wideband sinc5".      |
+| available``                           |                                                              |
++---------------------------------------+--------------------------------------------------------------+
+
+Per-channel calibration
+-----------------------
+
++---------------------------------------+--------------------------------------------------------------+
+| Attribute                             | Description                                                  |
++=======================================+==============================================================+
+| ``in_voltage<N>_calibbias``           | Channel offset calibration value                             |
++---------------------------------------+--------------------------------------------------------------+
+| ``in_voltage<N>_calibscale``          | Channel gain calibration value                               |
++---------------------------------------+--------------------------------------------------------------+
+| ``in_voltage<N>_phase``               | Channel phase calibration value.                             |
++---------------------------------------+--------------------------------------------------------------+
+
+Device buffers
+==============
+
+This driver supports IIO buffered data acquisition through IIO backends.
+When used with compatible backends like the AXI ADC, it provides:
+
+* High-speed simultaneous sampling across all enabled channels
+* Hardware-triggered data capture
+* DMA-based data transfer for minimal CPU overhead
+* CRC error detection
+
+See :doc:`iio_devbuf` for more information about IIO device buffers.
+
+Example usage
+=============
+
+.. code-block:: bash
+
+	# Read current sampling frequency for channel 0
+	cat /sys/bus/iio/devices/iio:device0/in_voltage0_sampling_frequency
+
+	# Update sampling frequency for channel 0
+	echo 8000 > /sys/bus/iio/devices/iio:device0/in_voltage0_sampling_frequency
+
+	# Read current filter type for channel 0
+	cat /sys/bus/iio/devices/iio:device0/in_voltage0_filter_type
+
+	# List available filter types for channel 0
+	cat /sys/bus/iio/devices/iio:device0/in_voltage0_filter_type_available
+
+	# Update filter type for channel 0 to wideband
+	echo wideband > /sys/bus/iio/devices/iio:device0/in_voltage0_filter_type
+
+	# Updating one channel also updates all channels assigned to the same
+	# mode profile (Mode A or Mode B) selected by adi,ch-mode in devicetree
+
+	# Read calibration scale for channel 0
+	cat /sys/bus/iio/devices/iio:device0/in_voltage0_calibscale
+
+	# Read phase calibration for channel 0
+	cat /sys/bus/iio/devices/iio:device0/in_voltage0_phase
+
+
+Unimplemented features
+======================
+
+* CRC message every 16 samples (CRC_SEL configuration) - currently only supports CRC every 4 samples
diff --git a/Documentation/iio/index.rst b/Documentation/iio/index.rst
index b02b879b053a..73c58cec7620 100644
--- a/Documentation/iio/index.rst
+++ b/Documentation/iio/index.rst
@@ -29,6 +29,7 @@ Industrial I/O Kernel Drivers
    ad7380
    ad7606
    ad7625
+   ad7768
    ad7944
    ade9000
    adf41513
diff --git a/MAINTAINERS b/MAINTAINERS
index 3de7ebcc4ee7..b93c77d3a4c3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1639,6 +1639,7 @@ L:	linux-iio@vger.kernel.org
 S:	Supported
 W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/iio/adc/adi,ad7768.yaml
+F:	Documentation/iio/ad7768.rst
 F:	drivers/gpio/gpio-ad7768.c
 F:	drivers/iio/adc/ad7768.c
 

-- 
2.43.0


