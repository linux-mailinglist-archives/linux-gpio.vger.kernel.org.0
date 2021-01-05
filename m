Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E0BB2EAD35
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jan 2021 15:17:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbhAEOPp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jan 2021 09:15:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726759AbhAEOPo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2021 09:15:44 -0500
X-Greylist: delayed 353 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 05 Jan 2021 06:15:04 PST
Received: from kelvin.aketzu.net (kelvin.aketzu.net [IPv6:2a04:3540:1000:310:284f:63ff:fefd:69b4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8636BC061574
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jan 2021 06:15:04 -0800 (PST)
Received: by kelvin.aketzu.net (Postfix, from userid 1000)
        id 188D646152; Tue,  5 Jan 2021 16:09:10 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aketzu.net; s=202002;
        t=1609855750;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=4LHrnCR//8SIEnMUNiAcYzOb2K41ehPD5P5YKfI2czw=;
        b=R791uImpl8xAq+ORSt/cTGTH+cpga+rShy72guV2b4jbfa/IVrfsMpO7CSifH8t/JauGqt
        mEBCCFNfiehVQQKlHmbqH0HSfd0aUXzbjyVnDs6FqXlrGmL6soH8PF1QoZ4IHSWvUQsmOr
        /piOvfLU5J6/0MKn9qJE2YqNUcV/9lQ=
Date:   Tue, 5 Jan 2021 16:09:10 +0200
From:   Anssi Kolehmainen <anssi@aketzu.net>
To:     linux-gpio@vger.kernel.org
Subject: [libgpiod] AC_FUNC_MALLOC cross-compile failure
Message-ID: <X/RzBqyV4hCdmrBy@kelvin.aketzu.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=aketzu.net;
        s=202002; t=1609855750;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=4LHrnCR//8SIEnMUNiAcYzOb2K41ehPD5P5YKfI2czw=;
        b=iy/RLtycYEghzeYWv5LKRGY7fcXQ6h+MyI03z+Pzf87L02sb69xcB3ULGxIw4PxpyGUfNE
        6SaURP9aYJIADYUOdCLPAovLCKiQWOtRASgmdzILeYiIBzD4lfcbUa/DfuMvaBC1HWFRSi
        JMzh8V39bkBODXcPSQpZLyi/ZQphO28=
ARC-Seal: i=1; s=202002; d=aketzu.net; t=1609855750; a=rsa-sha256;
        cv=none;
        b=fihguj6UNmpSDS9ebTrvwubl1xDGTIHoJugQRXybr+2optOfZ3Fuz59ji32G9NNaoWDOCj
        uAK/bnXABzO6OyiThM3JvdaQ3h72of+/4W0gIb41pzzARH2k3eCBv0VVB/joeXd7HvtGDD
        a/PCMHtg6vWwvZ37G5tEoy1+GwWjRAE=
ARC-Authentication-Results: i=1;
        kelvin.aketzu.net;
        none
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When libgpiod is cross-compiled it will use rpl_malloc instead malloc which then 
causes linking failure at later stage.

This happens because AC_FUNC_MALLOC wants to execute malloc() in a live system 
and thus cannot be run at cross-compilation time. libgpiod should just do 
AC_CHECK_FUNC instead.

diff --git a/configure.ac b/configure.ac
index ddb9dc2..5f41c4a 100644
--- a/configure.ac
+++ b/configure.ac
@@ -82,7 +82,7 @@ AC_DEFUN([HEADER_NOT_FOUND_CXX],
  
  # This is always checked (library needs this)
  AC_HEADER_STDC
-AC_FUNC_MALLOC
+AC_CHECK_FUNC([malloc], [], [FUNC_NOT_FOUND_LIB([malloc])])
  AC_CHECK_FUNC([ioctl], [], [FUNC_NOT_FOUND_LIB([ioctl])])
  AC_CHECK_FUNC([asprintf], [], [FUNC_NOT_FOUND_LIB([asprintf])])
  AC_CHECK_FUNC([scandir], [], [FUNC_NOT_FOUND_LIB([scandir])])
