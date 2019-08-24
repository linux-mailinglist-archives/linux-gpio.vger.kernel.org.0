Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F35739C108
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Aug 2019 01:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728055AbfHXXhm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Aug 2019 19:37:42 -0400
Received: from antares.kleine-koenig.org ([94.130.110.236]:40748 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727950AbfHXXhm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Aug 2019 19:37:42 -0400
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id 54F6A77F67D; Sun, 25 Aug 2019 01:37:39 +0200 (CEST)
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v1 1/2] vsprintf: introduce %dE for error constants
Date:   Sun, 25 Aug 2019 01:37:23 +0200
Message-Id: <20190824233724.1775-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	pr_info("probing failed (%dE)\n", ret);

expands to

	probing failed (EIO)

if ret holds -EIO (or EIO). This introduces an array of error codes. If
the error code is missing, %dE falls back to %d and so prints the plain
number.

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
Hello

there are many code sites that benefit from this. Just grep for
"(%d)" ...

As an example the follow up patch converts a printk to use this new
format escape.

Best regards
Uwe

 Documentation/core-api/printk-formats.rst |   3 +
 lib/vsprintf.c                            | 193 +++++++++++++++++++++-
 2 files changed, 195 insertions(+), 1 deletion(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index c6224d039bcb..81002414f956 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -35,6 +35,9 @@ Integer types
 		u64			%llu or %llx
 
 
+To print the name that corresponds to an integer error constant, use %dE and
+pass the int.
+
 If <type> is dependent on a config option for its size (e.g., sector_t,
 blkcnt_t) or is architecture-dependent for its size (e.g., tcflag_t), use a
 format specifier of its largest possible type and explicitly cast to it.
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index b0967cf17137..672eab8dab84 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -533,6 +533,192 @@ char *number(char *buf, char *end, unsigned long long num,
 	return buf;
 }
 
+#define ERRORCODE(x) { .str = #x, .err = x }
+
+static const struct {
+	const char *str;
+	int err;
+} errorcodes[] = {
+	ERRORCODE(EPERM),
+	ERRORCODE(ENOENT),
+	ERRORCODE(ESRCH),
+	ERRORCODE(EINTR),
+	ERRORCODE(EIO),
+	ERRORCODE(ENXIO),
+	ERRORCODE(E2BIG),
+	ERRORCODE(ENOEXEC),
+	ERRORCODE(EBADF),
+	ERRORCODE(ECHILD),
+	ERRORCODE(EAGAIN),
+	ERRORCODE(ENOMEM),
+	ERRORCODE(EACCES),
+	ERRORCODE(EFAULT),
+	ERRORCODE(ENOTBLK),
+	ERRORCODE(EBUSY),
+	ERRORCODE(EEXIST),
+	ERRORCODE(EXDEV),
+	ERRORCODE(ENODEV),
+	ERRORCODE(ENOTDIR),
+	ERRORCODE(EISDIR),
+	ERRORCODE(EINVAL),
+	ERRORCODE(ENFILE),
+	ERRORCODE(EMFILE),
+	ERRORCODE(ENOTTY),
+	ERRORCODE(ETXTBSY),
+	ERRORCODE(EFBIG),
+	ERRORCODE(ENOSPC),
+	ERRORCODE(ESPIPE),
+	ERRORCODE(EROFS),
+	ERRORCODE(EMLINK),
+	ERRORCODE(EPIPE),
+	ERRORCODE(EDOM),
+	ERRORCODE(ERANGE),
+	ERRORCODE(EDEADLK),
+	ERRORCODE(ENAMETOOLONG),
+	ERRORCODE(ENOLCK),
+	ERRORCODE(ENOSYS),
+	ERRORCODE(ENOTEMPTY),
+	ERRORCODE(ELOOP),
+	ERRORCODE(EWOULDBLOCK),
+	ERRORCODE(ENOMSG),
+	ERRORCODE(EIDRM),
+	ERRORCODE(ECHRNG),
+	ERRORCODE(EL2NSYNC),
+	ERRORCODE(EL3HLT),
+	ERRORCODE(EL3RST),
+	ERRORCODE(ELNRNG),
+	ERRORCODE(EUNATCH),
+	ERRORCODE(ENOCSI),
+	ERRORCODE(EL2HLT),
+	ERRORCODE(EBADE),
+	ERRORCODE(EBADR),
+	ERRORCODE(EXFULL),
+	ERRORCODE(ENOANO),
+	ERRORCODE(EBADRQC),
+	ERRORCODE(EBADSLT),
+	ERRORCODE(EBFONT),
+	ERRORCODE(ENOSTR),
+	ERRORCODE(ENODATA),
+	ERRORCODE(ETIME),
+	ERRORCODE(ENOSR),
+	ERRORCODE(ENONET),
+	ERRORCODE(ENOPKG),
+	ERRORCODE(EREMOTE),
+	ERRORCODE(ENOLINK),
+	ERRORCODE(EADV),
+	ERRORCODE(ESRMNT),
+	ERRORCODE(ECOMM),
+	ERRORCODE(EPROTO),
+	ERRORCODE(EMULTIHOP),
+	ERRORCODE(EDOTDOT),
+	ERRORCODE(EBADMSG),
+	ERRORCODE(EOVERFLOW),
+	ERRORCODE(ENOTUNIQ),
+	ERRORCODE(EBADFD),
+	ERRORCODE(EREMCHG),
+	ERRORCODE(ELIBACC),
+	ERRORCODE(ELIBBAD),
+	ERRORCODE(ELIBSCN),
+	ERRORCODE(ELIBMAX),
+	ERRORCODE(ELIBEXEC),
+	ERRORCODE(EILSEQ),
+	ERRORCODE(ERESTART),
+	ERRORCODE(ESTRPIPE),
+	ERRORCODE(EUSERS),
+	ERRORCODE(ENOTSOCK),
+	ERRORCODE(EDESTADDRREQ),
+	ERRORCODE(EMSGSIZE),
+	ERRORCODE(EPROTOTYPE),
+	ERRORCODE(ENOPROTOOPT),
+	ERRORCODE(EPROTONOSUPPORT),
+	ERRORCODE(ESOCKTNOSUPPORT),
+	ERRORCODE(EOPNOTSUPP),
+	ERRORCODE(EPFNOSUPPORT),
+	ERRORCODE(EAFNOSUPPORT),
+	ERRORCODE(EADDRINUSE),
+	ERRORCODE(EADDRNOTAVAIL),
+	ERRORCODE(ENETDOWN),
+	ERRORCODE(ENETUNREACH),
+	ERRORCODE(ENETRESET),
+	ERRORCODE(ECONNABORTED),
+	ERRORCODE(ECONNRESET),
+	ERRORCODE(ENOBUFS),
+	ERRORCODE(EISCONN),
+	ERRORCODE(ENOTCONN),
+	ERRORCODE(ESHUTDOWN),
+	ERRORCODE(ETOOMANYREFS),
+	ERRORCODE(ETIMEDOUT),
+	ERRORCODE(ECONNREFUSED),
+	ERRORCODE(EHOSTDOWN),
+	ERRORCODE(EHOSTUNREACH),
+	ERRORCODE(EALREADY),
+	ERRORCODE(EINPROGRESS),
+	ERRORCODE(ESTALE),
+	ERRORCODE(EUCLEAN),
+	ERRORCODE(ENOTNAM),
+	ERRORCODE(ENAVAIL),
+	ERRORCODE(EISNAM),
+	ERRORCODE(EREMOTEIO),
+	ERRORCODE(EDQUOT),
+	ERRORCODE(ENOMEDIUM),
+	ERRORCODE(EMEDIUMTYPE),
+	ERRORCODE(ECANCELED),
+	ERRORCODE(ENOKEY),
+	ERRORCODE(EKEYEXPIRED),
+	ERRORCODE(EKEYREVOKED),
+	ERRORCODE(EKEYREJECTED),
+	ERRORCODE(EOWNERDEAD),
+	ERRORCODE(ENOTRECOVERABLE),
+	ERRORCODE(ERFKILL),
+	ERRORCODE(EHWPOISON),
+	ERRORCODE(ERESTARTSYS),
+	ERRORCODE(ERESTARTNOINTR),
+	ERRORCODE(ERESTARTNOHAND),
+	ERRORCODE(ENOIOCTLCMD),
+	ERRORCODE(ERESTART_RESTARTBLOCK),
+	ERRORCODE(EPROBE_DEFER),
+	ERRORCODE(EOPENSTALE),
+	ERRORCODE(ENOPARAM),
+	ERRORCODE(EBADHANDLE),
+	ERRORCODE(ENOTSYNC),
+	ERRORCODE(EBADCOOKIE),
+	ERRORCODE(ENOTSUPP),
+	ERRORCODE(ETOOSMALL),
+	ERRORCODE(ESERVERFAULT),
+	ERRORCODE(EBADTYPE),
+	ERRORCODE(EJUKEBOX),
+	ERRORCODE(EIOCBQUEUED),
+	ERRORCODE(ERECALLCONFLICT),
+};
+
+static noinline_for_stack
+char *errstr(char *buf, char *end, unsigned long long num,
+	     struct printf_spec spec)
+{
+	char *errname = NULL;
+	size_t errnamelen, copy;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(errorcodes); ++i) {
+		if (num == errorcodes[i].err || num == -errorcodes[i].err) {
+			errname = errorcodes[i].str;
+			break;
+		}
+	}
+
+	if (!errname) {
+		/* fall back to ordinary number */
+		return number(buf, end, num, spec);
+	}
+
+	copy = errnamelen = strlen(errname);
+	if (copy > end - buf)
+		copy = end - buf;
+	buf = memcpy(buf, errname, copy);
+
+	return buf + errnamelen;
+}
+
 static noinline_for_stack
 char *special_hex_number(char *buf, char *end, unsigned long long num, int size)
 {
@@ -2566,7 +2752,12 @@ int vsnprintf(char *buf, size_t size, const char *fmt, va_list args)
 				num = va_arg(args, unsigned int);
 			}
 
-			str = number(str, end, num, spec);
+			if (spec.type == FORMAT_TYPE_INT && *fmt == 'E') {
+				fmt++;
+				str = errstr(str, end, num, spec);
+			} else {
+				str = number(str, end, num, spec);
+			}
 		}
 	}
 
-- 
2.20.1

