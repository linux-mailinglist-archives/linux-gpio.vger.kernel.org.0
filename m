Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D71A2E8577
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jan 2021 21:03:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727269AbhAAUDl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jan 2021 15:03:41 -0500
Received: from mout.gmx.net ([212.227.17.22]:53655 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727213AbhAAUDl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 1 Jan 2021 15:03:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1609531325;
        bh=hfDnNeUCZwBLottlBkKvDlJqHRMGiBRn+k8fIsv45yE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=gRMRKkTo0nB6MA3Afty8WuYBVsUylmcCSmkxkx9xPpZm0mDZJRueglicWDlp3wcDs
         PwBFyPK3i4NVPBhLbMTtqGctMYxCRMsTdeJ29bdtdAs1Lb9iSz3+uyKaiuzeCS+e3J
         kJyqe+0470jRcytwzXxsCol9xrXZqg255PSqfPmQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.57]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVNB1-1kSzjW2oFD-00SQmh; Fri, 01
 Jan 2021 21:02:05 +0100
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-doc@vger.kernel.org
Cc:     =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] docs: gpio: Fix formatting in description of gpiod_*_array_* functions
Date:   Fri,  1 Jan 2021 21:00:51 +0100
Message-Id: <20210101200052.967482-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qItgLAisBBFHYnP6C8k1SZxbSZ0lVs69gFN4PDcEPRz4ZYK2aOS
 7OV/EDpA6KKYeCFKO57a/lRyhw0fEL/aBXsxplM2kf03YWw9V6x8/NIZCrlPT4czB6IL4zd
 e4muiwsZgsTJu3GV6YmwlGuKq/+V1G8gKfX6B9eYChFNmReQjiOi2amPvhklXcgah5KC+1L
 s8eZJIhIL6u2E4VUrxEKQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:scAqxaIHHrs=:JXE2ki0KiFBNH+s5G5/zim
 k7ce74kIrDiWDOryvAMGd0vvt/nPn8ZS3qOY3OCoUWZsVImLCU3AqJqikNn2oiImhpRqtFMzv
 7rrltj5KOTEecdBji0wh5QLnBRi+XxCjY4zMz/J6JUOo73Yco9Q5ZYbLCbAEcYlMWQ5f0abPc
 OzfM1oD8OUgu9zTGnE2kc467pSCgl+LoUR/KCu3CW85kZwPfFHhLNhEaiuXtbBcHmJ2ss0+Bo
 +D2eeyBMTM4arPOaCrBu9t15+5zCbsIpWCAJr3e9XBBtCJbwLAwnb/nDiGy0UKdJ/1KhoPuJ3
 Zp1JSceeulSkONHE8LA43HOOL4f19az7XTbTz1DYVHfIZ0eIgOiCoN+yEStblY3s5mscVzQ2Q
 NAePceMaJJ+Ghp1iqEH/GfCLKrk+BgrIUY2HXW3xB432M1CydHqaq5bQj4Or9NNoa1AHEsuYT
 CIiRaUmuyo0O6s1hn16lGdATlkePFz5UENsjQ6AlF2fhUyW07vQs+02hAcDzu9s27q+i7Hp64
 OOA2QLxb35PM8OK8oXFGcYKAJFC2ajLFAWxxZWgGbIsy99Olq3nI4z6Ebk2j6Mo5L0sYdDGuY
 G3k1Lc4tzf1NmnJ+yM7N1IXg/E0htCFnVeFWC3t5OuBU4bpKR3BDyMFc6WayUeNUhD4jZcLqQ
 XrXgPjlfam7XK6A30C+CgQzAHnabhmqR4Fqq4/1IpywY99ZoQlmKQQlmBwGZ5wj4xcvAPACfx
 ifSGmV4OamzVSnrTjWlD/0qKKITObId2CSk1QF3OB12o9PIPMQXE+UmVNGx94CeDse7ggzQCh
 z38b0Ce0L3/MeYghw4qkT3E5SEjvA2yFnMl/P4IDKY3VyD7fFUEUnaZOQxUjCw0O9Cbeo/HWb
 nMMHJTACM4d/xFXsLcHw==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The gpiod_*_array_* functions take four arguments, not three.
Additionally, the formatting of the "value_bitmap" line results in
misformatted HTML, so fix that.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 Documentation/driver-api/gpio/consumer.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/dr=
iver-api/gpio/consumer.rst
index 173e4c7b037d0..22271c342d923 100644
=2D-- a/Documentation/driver-api/gpio/consumer.rst
+++ b/Documentation/driver-api/gpio/consumer.rst
@@ -361,12 +361,13 @@ corresponding chip driver. In that case a significan=
tly improved performance
 can be expected. If simultaneous access is not possible the GPIOs will be
 accessed sequentially.

-The functions take three arguments:
+The functions take four arguments:
+
 	* array_size	- the number of array elements
 	* desc_array	- an array of GPIO descriptors
 	* array_info	- optional information obtained from gpiod_get_array()
 	* value_bitmap	- a bitmap to store the GPIOs' values (get) or
-			  a bitmap of values to assign to the GPIOs (set)
+          a bitmap of values to assign to the GPIOs (set)

 The descriptor array can be obtained using the gpiod_get_array() function
 or one of its variants. If the group of descriptors returned by that func=
tion
=2D-
2.29.2

